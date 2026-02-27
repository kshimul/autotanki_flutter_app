import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/design_tokens.dart';
import '../../../core/theme/app_decorations.dart';
import '../../../shared/widgets/grid_background.dart';
import '../../../features/dashboard/application/dashboard_providers.dart';
import '../../../shared/models/telemetry_model.dart';
import '../data/insight_repository.dart';

// ─────────────────────────────────────────────────────────────────────────────
// INSIGHT SCREEN — Water level trends with fl_chart
// Data from Isar local cache (no extra API call needed)
// ─────────────────────────────────────────────────────────────────────────────

class InsightScreen extends ConsumerWidget {
  const InsightScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final device = ref.watch(deviceSelectorProvider);
    if (device == null) {
      return const Scaffold(
        backgroundColor: AppColors.bgDark,
        body: Center(child: Text('No device selected', style: TextStyle(color: AppColors.textSecondary))),
      );
    }

    final range       = ref.watch(selectedInsightRangeProvider);
    final dataAsync   = ref.watch(insightDataProvider(device.id));

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: GridBackground(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Header ─────────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.lg, vertical: Spacing.md),
                child: Row(
                  children: [
                    Text('Insights',
                        style: Theme.of(context).textTheme.titleLarge),
                    const Spacer(),
                    // Range picker chips
                    ...InsightRange.values.map((r) => GestureDetector(
                          onTap: () => ref
                              .read(selectedInsightRangeProvider.notifier)
                              .state = r,
                          child: AnimatedContainer(
                            duration: AppDurations.fast,
                            margin: const EdgeInsets.only(left: Spacing.xs),
                            padding: const EdgeInsets.symmetric(
                                horizontal: Spacing.sm, vertical: Spacing.xs),
                            decoration: BoxDecoration(
                              color: range == r
                                  ? AppColors.primary
                                  : AppColors.surfaceCard,
                              borderRadius:
                                  BorderRadius.circular(AppRadius.full),
                              border: Border.all(
                                color: range == r
                                    ? AppColors.primary
                                    : AppColors.surfaceHighlight,
                              ),
                            ),
                            child: Text(
                              r.label,
                              style: TextStyle(
                                color: range == r
                                    ? Colors.white
                                    : AppColors.textSecondary,
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),

              // ── Chart ────────────────────────────────────────────────────
              Expanded(
                child: dataAsync.when(
                  loading: () => const Center(
                      child: CircularProgressIndicator(
                          color: AppColors.primary)),
                  error: (e, _) => Center(
                      child: Text('Error loading data',
                          style: TextStyle(color: AppColors.danger))),
                  data: (data) => data.isEmpty
                      ? _EmptyState()
                      : _InsightContent(data: data),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Content ─────────────────────────────────────────────────────────────────

class _InsightContent extends StatelessWidget {
  final List<TelemetryData> data;
  const _InsightContent({required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── OHT Level Chart ─────────────────────────────────────────
          _ChartCard(
            title: 'OHT Water Level',
            subtitle: 'Overhead Tank (%)',
            color: AppColors.waterFull,
            spots: _toSpots(data, 'oht'),
          ),
          const SizedBox(height: Spacing.md),

          // ── UGT Level Chart ─────────────────────────────────────────
          _ChartCard(
            title: 'UGT Water Level',
            subtitle: 'Underground Tank (%)',
            color: AppColors.primary,
            spots: _toSpots(data, 'ugt'),
          ),
          const SizedBox(height: Spacing.md),

          // ── Power Chart ─────────────────────────────────────────────
          _ChartCard(
            title: 'Power Consumption',
            subtitle: 'Watts',
            color: AppColors.warning,
            spots: _toPowerSpots(data),
            maxY: 3000,
          ),
          const SizedBox(height: Spacing.md),

          // ── Summary Stats ────────────────────────────────────────────
          _SummaryStats(data: data),
          const SizedBox(height: Spacing.xl),
        ],
      ),
    );
  }

  List<FlSpot> _toSpots(List<TelemetryData> data, String tank) {
    final sorted = List.of(data)
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
    return sorted.asMap().entries.map((e) {
      final level = tank == 'oht' ? e.value.ohtLevel : e.value.ugtLevel;
      return FlSpot(e.key.toDouble(), level.clamp(0, 100));
    }).toList();
  }

  List<FlSpot> _toPowerSpots(List<TelemetryData> data) {
    final sorted = List.of(data)
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
    return sorted.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.powerWatts.clamp(0, 3000));
    }).toList();
  }
}

// ─── Chart Card ──────────────────────────────────────────────────────────────

class _ChartCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final List<FlSpot> spots;
  final double maxY;

  const _ChartCard({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.spots,
    this.maxY = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.surfaceCard(),
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 2),
          Text(subtitle,
              style: TextStyle(
                  color: AppColors.textTertiary, fontSize: 11)),
          const SizedBox(height: Spacing.md),
          SizedBox(
            height: 160,
            child: spots.isEmpty
                ? Center(
                    child: Text('No data',
                        style: TextStyle(color: AppColors.textTertiary)))
                : LineChart(
                    LineChartData(
                      minY: 0,
                      maxY: maxY,
                      gridData: FlGridData(
                        drawVerticalLine: false,
                        getDrawingHorizontalLine: (_) => FlLine(
                          color: AppColors.surfaceHighlight,
                          strokeWidth: 1,
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 36,
                            getTitlesWidget: (v, _) => Text(
                              '${v.toInt()}',
                              style: const TextStyle(
                                  color: AppColors.textTertiary,
                                  fontSize: 9),
                            ),
                          ),
                        ),
                        rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: spots,
                          isCurved: true,
                          color: color,
                          barWidth: 2,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show: true,
                            color: color.withOpacity(0.1),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

// ─── Summary Stats ────────────────────────────────────────────────────────────

class _SummaryStats extends StatelessWidget {
  final List<TelemetryData> data;
  const _SummaryStats({required this.data});

  @override
  Widget build(BuildContext context) {
    final avgOht = data.isEmpty
        ? 0.0
        : data.map((d) => d.ohtLevel).reduce((a, b) => a + b) / data.length;
    final avgUgt = data.isEmpty
        ? 0.0
        : data.map((d) => d.ugtLevel).reduce((a, b) => a + b) / data.length;
    final totalEnergy = data.isEmpty
        ? 0.0
        : data.map((d) => d.energyKwh).reduce((a, b) => a + b);

    return Container(
      decoration: AppDecorations.surfaceCard(),
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Summary', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: Spacing.sm),
          Row(
            children: [
              _StatTile(label: 'Avg OHT', value: '${avgOht.toStringAsFixed(1)}%',
                  color: AppColors.waterFull),
              _StatTile(label: 'Avg UGT', value: '${avgUgt.toStringAsFixed(1)}%',
                  color: AppColors.primary),
              _StatTile(label: 'Energy Used', value: '${totalEnergy.toStringAsFixed(2)} kWh',
                  color: AppColors.warning),
              _StatTile(label: 'Data Points', value: '${data.length}',
                  color: AppColors.textSecondary),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _StatTile({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(value,
              style: TextStyle(
                  color: color,
                  fontSize: 14,
                  fontWeight: FontWeight.w800)),
          const SizedBox(height: 2),
          Text(label,
              style: const TextStyle(
                  color: AppColors.textTertiary, fontSize: 9)),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.bar_chart_outlined,
              color: AppColors.textTertiary, size: 64),
          const SizedBox(height: Spacing.md),
          Text('No data for this period',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
          const SizedBox(height: Spacing.xs),
          Text('Connect your device to start recording data.',
              style: TextStyle(color: AppColors.textTertiary, fontSize: 12)),
        ],
      ),
    );
  }
}
