import 'package:flutter/material.dart';

class QROverlayPainter extends CustomPainter {
  final double animationValue;

  QROverlayPainter({this.animationValue = 0.0});

  @override
  void paint(Canvas canvas, Size size) {
    final cornerLength = 50.0;
    final cornerThickness = 5.0;
    final cornerRadius = 24.0;

    // white color for all elements
    final whiteColor = Colors.white;

    // animated scanning line
    final scanLineY = (size.height * animationValue);
    final scanLinePaint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.transparent,
          whiteColor.withValues(alpha: 0.5),
          whiteColor.withValues(alpha: 0.9),
          whiteColor.withValues(alpha: 0.5),
          Colors.transparent,
        ],
        stops: const [0.0, 0.3, 0.5, 0.7, 1.0],
      ).createShader(Rect.fromLTWH(0, scanLineY - 3, size.width, 6))
      ..style = PaintingStyle.fill;

    canvas.drawRect(
      Rect.fromLTWH(0, scanLineY - 3, size.width, 6),
      scanLinePaint,
    );

    // Draw corner brackets in white
    _drawModernCorner(
      canvas,
      Offset(0, 0),
      cornerLength,
      cornerThickness,
      cornerRadius,
      true,
      true,
      whiteColor,
    );

    _drawModernCorner(
      canvas,
      Offset(size.width, 0),
      cornerLength,
      cornerThickness,
      cornerRadius,
      false,
      true,
      whiteColor,
    );

    _drawModernCorner(
      canvas,
      Offset(0, size.height),
      cornerLength,
      cornerThickness,
      cornerRadius,
      true,
      false,
      whiteColor,
    );

    _drawModernCorner(
      canvas,
      Offset(size.width, size.height),
      cornerLength,
      cornerThickness,
      cornerRadius,
      false,
      false,
      whiteColor,
    );

    // glow effect around corners
    _drawCornerGlow(canvas, Offset(0, 0), cornerLength, whiteColor);
    _drawCornerGlow(canvas, Offset(size.width, 0), cornerLength, whiteColor);
    _drawCornerGlow(canvas, Offset(0, size.height), cornerLength, whiteColor);
    _drawCornerGlow(
      canvas,
      Offset(size.width, size.height),
      cornerLength,
      whiteColor,
    );
  }

  void _drawModernCorner(
    Canvas canvas,
    Offset corner,
    double length,
    double thickness,
    double radius,
    bool isLeft,
    bool isTop,
    Color color,
  ) {
    final path = Path();
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round
      ..color = color;

    // small offset to ensure corners are fully visible
    final offset = thickness / 2;

    if (isLeft && isTop) {
      // Top-left
      path.moveTo(corner.dx + offset, corner.dy + length);
      path.lineTo(corner.dx + offset, corner.dy + radius);
      path.quadraticBezierTo(
        corner.dx + offset,
        corner.dy + offset,
        corner.dx + radius,
        corner.dy + offset,
      );
      path.lineTo(corner.dx + length, corner.dy + offset);
    } else if (!isLeft && isTop) {
      // Top-right
      path.moveTo(corner.dx - offset, corner.dy + length);
      path.lineTo(corner.dx - offset, corner.dy + radius);
      path.quadraticBezierTo(
        corner.dx - offset,
        corner.dy + offset,
        corner.dx - radius,
        corner.dy + offset,
      );
      path.lineTo(corner.dx - length, corner.dy + offset);
    } else if (isLeft && !isTop) {
      // Bottom-left
      path.moveTo(corner.dx + offset, corner.dy - length);
      path.lineTo(corner.dx + offset, corner.dy - radius);
      path.quadraticBezierTo(
        corner.dx + offset,
        corner.dy - offset,
        corner.dx + radius,
        corner.dy - offset,
      );
      path.lineTo(corner.dx + length, corner.dy - offset);
    } else {
      // Bottom-right
      path.moveTo(corner.dx - offset, corner.dy - length);
      path.lineTo(corner.dx - offset, corner.dy - radius);
      path.quadraticBezierTo(
        corner.dx - offset,
        corner.dy - offset,
        corner.dx - radius,
        corner.dy - offset,
      );
      path.lineTo(corner.dx - length, corner.dy - offset);
    }

    canvas.drawPath(path, paint);
  }

  void _drawCornerGlow(
    Canvas canvas,
    Offset corner,
    double radius,
    Color color,
  ) {
    final glowPaint = Paint()
      ..color = color.withValues(alpha: 0.4)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 15);

    canvas.drawCircle(corner, radius / 2.5, glowPaint);
  }

  @override
  bool shouldRepaint(QROverlayPainter oldDelegate) =>
      oldDelegate.animationValue != animationValue;
}
