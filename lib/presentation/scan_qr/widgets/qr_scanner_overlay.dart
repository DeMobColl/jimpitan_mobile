import 'package:flutter/material.dart';
import 'package:jimpitan/presentation/scan_qr/widgets/qr_overlay_painter.dart';

class QRScannerOverlay extends StatefulWidget {
  const QRScannerOverlay({super.key});

  @override
  State<QRScannerOverlay> createState() => _QRScannerOverlayState();
}

class _QRScannerOverlayState extends State<QRScannerOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final overlaySize = 280.0;
    final centerY = screenSize.height * 0.35;

    return Stack(
      children: [
        Container(color: Colors.black.withOpacity(0.4)),
        // square area with animated scanner
        Positioned(
          top: centerY - (overlaySize / 2),
          left: (screenSize.width - overlaySize) / 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: overlaySize,
              width: overlaySize,
              color: Colors.transparent,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return CustomPaint(
                    painter: QROverlayPainter(animationValue: _animation.value),
                  );
                },
              ),
            ),
          ),
        ),
        // Text content
        Positioned(
          top: centerY + (overlaySize / 2) + 24,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Posisikan QR Code di dalam area',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
