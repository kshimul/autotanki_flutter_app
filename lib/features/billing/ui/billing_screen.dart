import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/design_tokens.dart';
import '../../../core/theme/app_decorations.dart';
import '../../../shared/widgets/grid_background.dart';
import '../../../shared/models/payment_model.dart';
import '../../../shared/models/subscription_model.dart';
import '../../../features/dashboard/application/dashboard_providers.dart';
import '../data/billing_repository.dart';

// ─────────────────────────────────────────────────────────────────────────────
// BILLING SCREEN — Subscription + Backend-Driven gateway picker
// Flow: Select Package → Select Gateway → WebView paymentUrl → Poll status
// ─────────────────────────────────────────────────────────────────────────────

class BillingScreen extends ConsumerWidget {
  const BillingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final device = ref.watch(deviceSelectorProvider);
    if (device == null) {
      return const Scaffold(
        backgroundColor: AppColors.bgDark,
        body: Center(
            child: Text('No device', style: TextStyle(color: AppColors.textSecondary))),
      );
    }

    final subAsync  = ref.watch(activeSubscriptionProvider(device.id));
    final pkgsAsync = ref.watch(packagesProvider);

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: GridBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: Spacing.md),
                Text('Billing', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: Spacing.md),

                // ── Active subscription status ─────────────────────────────
                subAsync.when(
                  loading: () => _SkeletonBox(height: 80),
                  error: (_, __) => const SizedBox.shrink(),
                  data: (sub) => sub != null
                      ? _ActiveSubCard(sub: sub)
                      : _NoSubBanner(),
                ),
                const SizedBox(height: Spacing.md),

                // ── Package selector ──────────────────────────────────────
                Text('Choose Plan',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: Spacing.sm),
                pkgsAsync.when(
                  loading: () => const Center(
                      child: CircularProgressIndicator(color: AppColors.primary)),
                  error: (_, __) => Text('Failed to load plans',
                      style: TextStyle(color: AppColors.danger)),
                  data: (pkgs) => Column(
                    children: pkgs
                        .map((p) => _PackageCard(package: p, deviceId: device.id))
                        .toList(),
                  ),
                ),
                const SizedBox(height: Spacing.xl),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Active Sub Card ──────────────────────────────────────────────────────────

class _ActiveSubCard extends StatelessWidget {
  final Subscription sub;
  const _ActiveSubCard({required this.sub});

  @override
  Widget build(BuildContext context) {
    final isActive = sub.status == 'ACTIVE';
    final color = isActive ? AppColors.success : AppColors.warning;
    return Container(
      decoration: AppDecorations.surfaceCard(),
      padding: const EdgeInsets.all(Spacing.md),
      child: Row(
        children: [
          Icon(isActive ? Icons.check_circle : Icons.warning_amber,
              color: color, size: 32),
          const SizedBox(width: Spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sub.packageId.isNotEmpty ? 'Active Subscription' : 'Subscription',
                    style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 14)),
                Text(
                  isActive
                      ? 'Expires: ${sub.endDate.toLocal().toString().split(' ').first}'
                      : 'Status: ${sub.status}',
                  style: TextStyle(color: color, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NoSubBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.alertBanner(AppColors.warning),
      padding: const EdgeInsets.all(Spacing.md),
      child: Row(
        children: const [
          Icon(Icons.warning_amber, color: AppColors.warning),
          SizedBox(width: Spacing.sm),
          Expanded(
            child: Text(
              'No active subscription. Motor control is disabled.',
              style: TextStyle(color: AppColors.warning, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Package Card ─────────────────────────────────────────────────────────────

class _PackageCard extends ConsumerWidget {
  final SubscriptionPackage package;
  final String deviceId;
  const _PackageCard({required this.package, required this.deviceId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected   = ref.watch(selectedPackageProvider);
    final isSelected = selected?.id == package.id;

    return GestureDetector(
      onTap: () => ref.read(selectedPackageProvider.notifier).state = package,
      child: AnimatedContainer(
        duration: AppDurations.fast,
        margin: const EdgeInsets.only(bottom: Spacing.sm),
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.surfaceHighlight,
            width: isSelected ? 2 : 1,
          ),
        ),
        padding: const EdgeInsets.all(Spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(package.name,
                    style: TextStyle(
                        color: isSelected ? AppColors.primary : AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 15)),
                Text('৳${package.price}/${package.durationDays}d',
                    style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w800,
                        fontSize: 16)),
              ],
            ),
            const SizedBox(height: Spacing.xs),
            Text(package.description ?? '',
                style: const TextStyle(
                    color: AppColors.textTertiary, fontSize: 11)),
            if (isSelected) ...[
              const SizedBox(height: Spacing.sm),
              _GatewaySelector(package: package, deviceId: deviceId),
            ],
          ],
        ),
      ),
    );
  }
}

// ─── Gateway Selector (Backend-Driven UI) ────────────────────────────────────

class _GatewaySelector extends ConsumerWidget {
  final SubscriptionPackage package;
  final String deviceId;

  const _GatewaySelector({required this.package, required this.deviceId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gwAsync    = ref.watch(gatewaysProvider);
    final selectedGw = ref.watch(selectedGatewayProvider);

    return gwAsync.when(
      loading: () => const CircularProgressIndicator(
          color: AppColors.primary, strokeWidth: 2),
      error: (_, __) => Text('Failed to load gateways',
          style: TextStyle(color: AppColors.danger, fontSize: 11)),
      data: (gateways) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Payment Method',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 11)),
          const SizedBox(height: Spacing.xs),
          Wrap(
            spacing: Spacing.xs,
            children: gateways.map((gw) {
              final isSel = selectedGw?.code == gw.code;
              return GestureDetector(
                onTap: () =>
                    ref.read(selectedGatewayProvider.notifier).state = gw,
                child: AnimatedContainer(
                  duration: AppDurations.fast,
                  padding: const EdgeInsets.symmetric(
                      horizontal: Spacing.md, vertical: Spacing.xs),
                  decoration: BoxDecoration(
                    color: isSel
                        ? AppColors.primary.withOpacity(0.15)
                        : AppColors.surfaceDark,
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                    border: Border.all(
                      color: isSel ? AppColors.primary : AppColors.surfaceHighlight,
                    ),
                  ),
                  child: Text(gw.name,
                      style: TextStyle(
                          color: isSel
                              ? AppColors.primary
                              : AppColors.textSecondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w700)),
                ),
              );
            }).toList(),
          ),
          if (selectedGw != null) ...[
            const SizedBox(height: Spacing.sm),
            Container(
              decoration: BoxDecoration(
                boxShadow: [AppShadows.primaryGlow],
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              child: ElevatedButton(
                onPressed: () => _initiatePayment(context, ref, selectedGw),
                child: Text(
                    'Pay ৳${package.price} with ${selectedGw.name}'),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _initiatePayment(
    BuildContext context,
    WidgetRef ref,
    PaymentGateway gateway,
  ) async {
    try {
      final payment = await ref.read(billingRepositoryProvider).initiatePayment(
            SubscribeRequest(
              deviceId: deviceId,
              packageId: package.id,
              gateway: gateway.code,
            ),
          );
      if (context.mounted) {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _PaymentWebView(payment: payment),
          ),
        );
        // Poll subscription status after WebView closes (webhook race guard)
        ref.invalidate(activeSubscriptionProvider(deviceId));
        ref.read(selectedPackageProvider.notifier).state = null;
        ref.read(selectedGatewayProvider.notifier).state = null;
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Payment initiation failed: ${e.toString()}')),
        );
      }
    }
  }
}

// ─── Payment WebView ──────────────────────────────────────────────────────────
// NOTE: paymentUrl is sensitive — never logged or stored beyond this widget.
// Uses webview_flutter (official Flutter package).

class _PaymentWebView extends StatefulWidget {
  final Payment payment;
  const _PaymentWebView({required this.payment});

  @override
  State<_PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<_PaymentWebView> {
  late final WebViewController _controller;
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() => _loading = true),
          onPageFinished: (_) => setState(() => _loading = false),
          onNavigationRequest: (req) {
            final url = req.url;
            // Detect payment gateway redirect (success / cancel / return)
            if (url.contains('/callback/') ||
                url.contains('/success') ||
                url.contains('/cancel') ||
                url.contains('/return')) {
              // Close WebView → billing screen polls subscription status
              if (mounted) Navigator.of(context).pop();
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.payment.paymentUrl ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceCard,
        title: const Text('Payment',
            style: TextStyle(color: AppColors.textPrimary, fontSize: 15)),
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        bottom: _loading
            ? const PreferredSize(
                preferredSize: Size.fromHeight(2),
                child: LinearProgressIndicator(
                  color: AppColors.primary,
                  backgroundColor: AppColors.surfaceHighlight,
                ),
              )
            : null,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}

class _SkeletonBox extends StatelessWidget {
  final double height;
  const _SkeletonBox({required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
    );
  }
}
