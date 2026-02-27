import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../../../core/theme/design_tokens.dart';

// ─────────────────────────────────────────────────────────────────────────────
// INTERACTIVE TANK WIDGET
// Renders a Rive animation for the tank. Falls back to a custom-painted
// tank if Rive asset is not found (so dashboard works without the asset).
//
// Rive animation contract (firmware team):
//   - Asset: assets/rive/tank.riv
//   - StateMachine: "TankMachine"
//   - Inputs: "level" (Number 0-100), "isMotorOn" (Bool)
// ─────────────────────────────────────────────────────────────────────────────

class InteractiveTank extends StatefulWidget {
  final String tankId;   // 'oht' | 'ugt'
  final String label;
  final double level;    // 0.0–100.0 (%)
  final bool isMotorOn;

  const InteractiveTank({
    super.key,
    required this.tankId,
    required this.label,
    required this.level,
    required this.isMotorOn,
  });

  @override
  State<InteractiveTank> createState() => _InteractiveTankState();
}

class _InteractiveTankState extends State<InteractiveTank> {
  SMINumber? _levelInput;
  SMIBool?   _motorInput;
  bool _riveLoaded = false;

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      'TankMachine',
    );
    if (controller != null) {
      artboard.addController(controller);
      _levelInput = controller.findInput<double>('level') as SMINumber?;
      _motorInput = controller.findInput<bool>('isMotorOn') as SMIBool?;
      _levelInput?.value = widget.level;
      _motorInput?.value = widget.isMotorOn;
      setState(() => _riveLoaded = true);
    }
  }

  @override
  void didUpdateWidget(InteractiveTank old) {
    super.didUpdateWidget(old);
    if (_riveLoaded) {
      _levelInput?.value = widget.level;
      _motorInput?.value = widget.isMotorOn;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Tank visual ───────────────────────────────────────────────────
        SizedBox(
          width: 130,
          height: 160,
          child: _riveLoaded || !_riveLoaded
              ? Stack(
                  children: [
                    // Try Rive first
                    RiveAnimation.asset(
                      'assets/rive/tank.riv',
                      stateMachines: const ['TankMachine'],
                      onInit: _onRiveInit,
                      // If Rive fails (asset missing), CustomPaint shows instead
                    ),
                    // Fallback: always show procedural tank if Rive not loaded
                    if (!_riveLoaded)
                      _FallbackTank(
                        level: widget.level,
                        isMotorOn: widget.isMotorOn,
                      ),
                  ],
                )
              : _FallbackTank(
                  level: widget.level,
                  isMotorOn: widget.isMotorOn,
                ),
        ),

        const SizedBox(height: Spacing.sm),

        // ── Level text ────────────────────────────────────────────────────
        Text(
          '${widget.level.toStringAsFixed(0)}%',
          style: TextStyle(
            color: _levelColor(widget.level),
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: Spacing.xs / 2),
        Text(
          widget.label,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),

        // ── Motor indicator ───────────────────────────────────────────────
        if (widget.isMotorOn)
          Container(
            margin: const EdgeInsets.only(top: Spacing.xs),
            padding: const EdgeInsets.symmetric(
                horizontal: Spacing.sm, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.success.withOpacity(0.15),
              borderRadius: BorderRadius.circular(AppRadius.full),
              border: Border.all(
                  color: AppColors.success.withOpacity(0.4)),
            ),
            child: const Text(
              '⚡ Running',
              style: TextStyle(
                  color: AppColors.success,
                  fontSize: 10,
                  fontWeight: FontWeight.w700),
            ),
          ),
      ],
    );
  }

  Color _levelColor(double level) {
    if (level >= 60) return AppColors.waterFull;
    if (level >= 30) return AppColors.waterMid;
    return AppColors.waterLow;
  }
}

// ─── Fallback procedural tank (no Rive asset needed) ─────────────────────────

class _FallbackTank extends StatelessWidget {
  final double level;
  final bool isMotorOn;

  const _FallbackTank({required this.level, required this.isMotorOn});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _TankPainter(level: level / 100, isMotorOn: isMotorOn),
    );
  }
}

class _TankPainter extends CustomPainter {
  final double level; // 0.0 – 1.0
  final bool isMotorOn;

  _TankPainter({required this.level, required this.isMotorOn});

  Color get _waterColor {
    if (level >= 0.6) return AppColors.waterFull;
    if (level >= 0.3) return AppColors.waterMid;
    return AppColors.waterLow;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final bodyRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(16),
    );

    // Tank shell
    canvas.drawRRect(
      bodyRect,
      Paint()
        ..color = AppColors.surfaceDark
        ..style = PaintingStyle.fill,
    );

    // Water fill
    final waterTop = size.height * (1 - level);
    final waterRect = RRect.fromRectAndCorners(
      Rect.fromLTWH(0, waterTop, size.width, size.height - waterTop),
      bottomLeft: const Radius.circular(16),
      bottomRight: const Radius.circular(16),
    );
    canvas.drawRRect(
      waterRect,
      Paint()
        ..color = _waterColor.withOpacity(0.7)
        ..style = PaintingStyle.fill,
    );

    // Tank border
    canvas.drawRRect(
      bodyRect,
      Paint()
        ..color = isMotorOn
            ? AppColors.success.withOpacity(0.5)
            : AppColors.surfaceHighlight
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );
  }

  @override
  bool shouldRepaint(_TankPainter old) =>
      old.level != level || old.isMotorOn != isMotorOn;
}
