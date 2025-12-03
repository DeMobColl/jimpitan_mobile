import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jimpitan/presentation/qr_scan_customer/helper/qr_camera_helper.dart';
import 'package:jimpitan/presentation/qr_scan_customer/helper/scan_qr_dialogs_helper.dart';
import 'package:jimpitan/presentation/qr_scan_customer/providers/qr_scan_provider.dart';
import 'package:jimpitan/presentation/qr_scan_customer/widgets/qr_scanner_overlay.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScanCustomerPage extends ConsumerStatefulWidget {
  const QrScanCustomerPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _QrScanPageExampleState();
}

class _QrScanPageExampleState extends ConsumerState<QrScanCustomerPage> {
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

    // Listen to provider state changes to show dialogs
    ref.listenManual(qrScanNotifierProvider, (previous, next) {
      _handleStateChange(previous, next);
    });
  }

  @override
  void dispose() {
    _cameraHelper.dispose();
    super.dispose();
  }

  /// Handle state changes from provider
  /// This is where we show dialogs based on state
  void _handleStateChange(
    AsyncValue<dynamic>? previous,
    AsyncValue<dynamic> next,
  ) {
    next.when(
      data: (response) {
        // Close loading dialog if it was showing
        if (previous?.isLoading == true && mounted) {
          Navigator.of(context).pop();
        }

        if (response != null) {
          if (response.isSuccess && response.data != null) {
            // Show success dialog
            if (mounted) {
              ScanQrDialogsHelper.showAttendanceSuccessDialog(context);
            }
          } else {
            // Show error dialog
            if (mounted) {
              ScanQrDialogsHelper.showAttendanceErrorDialog(
                context,
                response.data?.name ??
                    'QR Code tidak valid atau sudah kadaluarsa',
                _restartCamera,
              );
            }
          }
        }
      },
      loading: () {
        // Pause camera when loading
        _controller.stop();

        // Show loading dialog
        if (mounted) {
          ScanQrDialogsHelper.showLoadingDialog(
            context,
            'Memproses QR Code...',
          );
        }
      },
      error: (error, _) {
        // Close loading dialog if it was showing
        if (previous?.isLoading == true && mounted) {
          Navigator.of(context).pop();
        }

        // Show error dialog
        if (mounted) {
          ScanQrDialogsHelper.showAttendanceErrorDialog(
            context,
            'Terjadi kesalahan: ${error.toString()}',
            _restartCamera,
          );
        }
      },
    );
  }

  /// Restart camera after error
  void _restartCamera() async {
    ref.read(qrScanNotifierProvider.notifier).reset();
    await _controller.start();
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
    final scanState = ref.read(qrScanNotifierProvider);

    // Don't process if already loading
    if (scanState.isLoading) return;

    final barcodes = capture.barcodes;
    for (final barcode in barcodes) {
      final code = barcode.rawValue;

      if (code != null && code.isNotEmpty) {
        // Trigger scan - provider handles the logic
        ref.read(qrScanNotifierProvider.notifier).scanQrCode(code);
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
          MobileScanner(
            controller: _controller,
             onDetect: _onDetect,
             errorBuilder: (context, error) => _cameraHelper.buildErrorWidget(error),
             placeholderBuilder: (context) => _cameraHelper.buildPlaceholder(),
            ),
          // QR Scanner Overlay
          const QRScannerOverlay(),
        ],
      ),
    );
  }
}
