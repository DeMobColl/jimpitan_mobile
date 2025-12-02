import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jimpitan/presentation/scan_qr/camera_controller_helper.dart';
import 'package:jimpitan/presentation/scan_qr/scan_qr_dialogs_helper.dart';
import 'package:jimpitan/presentation/scan_qr/widgets/qr_scanner_overlay.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrPage extends ConsumerStatefulWidget {
  const ScanQrPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScanQrPageState();
}

class _ScanQrPageState extends ConsumerState<ScanQrPage> {
  final MobileScannerController _controller = MobileScannerController(
    autoStart: false,
  );
  late final CameraControllerHelper _cameraHelper;
  bool _permissionDenied = false;

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
    );

    _cameraHelper.initialize();
  }

  void _restartCamera() async {
    if (!mounted) return;
    await _cameraHelper.restartCamera();
  }

  void _showLoadingDialog(String message) {
    if (!mounted) return;
    ScanQrDialogsHelper.showLoadingDialog(context, message);
  }

  @override
  void dispose() {
    _cameraHelper.dispose();
    super.dispose();
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
          onPressed: () => context.pop()
        ),
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: _controller,
            tapToFocus: true,
            onDetect: (capture) {},
            errorBuilder: (context, error) =>
                _cameraHelper.buildErrorWidget(error),
            // placeholderBuilder: (context) => _cameraHelper.buildPlaceholder(),
          ),
          const QRScannerOverlay(),
        ],
      ),
    );
  }
}
