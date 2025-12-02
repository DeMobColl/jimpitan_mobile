import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CameraControllerHelper with WidgetsBindingObserver {
  final MobileScannerController controller;
  final VoidCallback onPermissionDenied;
  bool _isProcessing = false;

  CameraControllerHelper({
    required this.controller,
    required this.onPermissionDenied,
  });

  void initialize() {
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        if (!controller.value.isRunning) {
          await controller.start();
        }
      } catch (e) {
        log('[ScanQR] Error starting camera: $e');
      }
    });
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    controller.dispose();
  }

  Future<void> restartCamera() async {
    try {
      _isProcessing = false;
      if (!controller.value.isRunning) {
        await controller.start();
      }
    } catch (e) {
      log('[ScanQR] Error restarting camera: $e');
      _isProcessing = false;
    }
  }

  bool get isProcessing => _isProcessing;
  set isProcessing(bool value) => _isProcessing = value;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (!controller.value.hasCameraPermission) {
      return;
    }

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        if (controller.value.isRunning) {
          unawaited(controller.stop());
        }
        break;
      case AppLifecycleState.resumed:
      log('[CameraControllerHelper] App resumed');
        if (!_isProcessing && !controller.value.isRunning) {
          unawaited(controller.start());
        }
        break;
      case AppLifecycleState.inactive:
        break;
    }
  }

  Widget buildErrorWidget(MobileScannerException error) {
    if (error.errorCode == MobileScannerErrorCode.permissionDenied) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onPermissionDenied();
      });
      return const SizedBox();
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error, size: 64, color: Colors.white),
          const SizedBox(height: 16),
          Text(
            'Error: ${error.errorCode.name}',
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget buildPlaceholder() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
