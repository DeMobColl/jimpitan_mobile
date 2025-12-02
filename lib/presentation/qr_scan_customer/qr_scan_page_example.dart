import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jimpitan/presentation/qr_scan_customer/helper/qr_camera_helper.dart';
import 'package:jimpitan/presentation/qr_scan_customer/providers/qr_scan_provider.dart';
import 'package:jimpitan/presentation/qr_scan_customer/widgets/qr_scanner_overlay.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

/// Example implementation of QR Scan Page with the new provider
/// This shows how to integrate the QrScanNotifier provider
class QrScanPageExample extends ConsumerStatefulWidget {
  const QrScanPageExample({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _QrScanPageExampleState();
}

class _QrScanPageExampleState extends ConsumerState<QrScanPageExample> {
  final MobileScannerController _controller = MobileScannerController(
    autoStart: false,
  );
  late final CameraControllerHelper _cameraHelper;
  bool _permissionDenied = false;
  bool _isTorchOn = false;

  @override
  void initState() {
    super.initState();
    _cameraHelper = CameraControllerHelper(
      controller: _controller,
      onPermissionDenied: () {
        if (mounted && !_permissionDenied) {
          setState(() => _permissionDenied = true);
        }
      },
      onTorchStateChanged: () {
        if (mounted) {
          setState(() => _isTorchOn = _cameraHelper.isTorchOn);
        }
      },
    );

    _cameraHelper.initialize();
  }

  @override
  void dispose() {
    _cameraHelper.dispose();
    super.dispose();
  }

  void _toggleTorch() async {
    try {
      await _cameraHelper.toggleTorch();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Flash tidak tersedia pada perangkat ini'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  /// Handle QR code detection
  void _onDetect(BarcodeCapture capture) {
    final List<Barcode> barcodes = capture.barcodes;

    // Get the scan state to check if processing
    final scanState = ref.read(qrScanNotifierProvider);

    // Don't process if already processing
    if (scanState.isProcessing) return;

    for (final barcode in barcodes) {
      final String? code = barcode.rawValue;

      if (code != null && code.isNotEmpty) {
        // Use the provider to scan QR code
        ref
            .read(qrScanNotifierProvider.notifier)
            .scanQrCode(
              context: context,
              qrHash: code,
              cameraController: _controller,
            );

        // Break after first valid code
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch the scan state
    final scanState = ref.watch(qrScanNotifierProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Scan QR Jimpitan',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isTorchOn ? Icons.flash_on : Icons.flash_off,
              color: Colors.white,
            ),
            onPressed: _toggleTorch,
          ),
        ],
      ),
      body: Stack(
        children: [
          // Camera Scanner
          MobileScanner(controller: _controller, onDetect: _onDetect),
          // QR Scanner Overlay
          const QRScannerOverlay(),
          // Status indicator (optional)
          if (scanState.isProcessing)
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 32),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Memproses QR Code...',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
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
