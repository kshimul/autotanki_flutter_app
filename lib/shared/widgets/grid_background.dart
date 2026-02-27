import 'package:flutter/material.dart';
import '../../core/theme/design_tokens.dart';

// ─────────────────────────────────────────────────────────────────────────────
// GRID BACKGROUND — bg-grid-pattern from HTML reference
// 20×20px grid, 3% opacity white lines — used on ALL main screens
//
// Usage:
//   Scaffold(
//     body: GridBackground(
//       child: YourScreenContent(),
//     ),
//   )
// ─────────────────────────────────────────────────────────────────────────────

class GridBackground extends StatelessWidget {
  final Widget child;
  final Color? gridColor;
  final double gridSpacing;

  const GridBackground({
    super.key,
    required this.child,
    this.gridColor,
    this.gridSpacing = 20.0, // 20×20px matches HTML reference
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: _GridPainter(
              color: gridColor ?? Colors.white.withOpacity(0.03),
              spacing: gridSpacing,
            ),
          ),
        ),
        child,
      ],
    );
  }
}

class _GridPainter extends CustomPainter {
  final Color color;
  final double spacing;

  const _GridPainter({required this.color, required this.spacing});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0;

    // Vertical lines
    for (double x = 0; x <= size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    // Horizontal lines
    for (double y = 0; y <= size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter old) =>
      old.color != color || old.spacing != spacing;
}

// ─────────────────────────────────────────────────────────────────────────────
// MESH GRADIENT BACKGROUND — Used on login/signup screens
// Matches: bg-mesh in login.html (radial gradients from primary)
// ─────────────────────────────────────────────────────────────────────────────

class MeshGradientBackground extends StatelessWidget {
  final Widget child;

  const MeshGradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.bgDark),
      child: Stack(
        children: [
          // Center glow (matching radial-gradient at 50% 40%)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: 0,
            right: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.15),
                    Colors.transparent,
                  ],
                  radius: 0.8,
                ),
              ),
            ),
          ),
          // Bottom-left glow
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.10),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // Bottom-right glow
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.10),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
