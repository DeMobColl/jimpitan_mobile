import 'package:flutter/material.dart';
import 'package:jimpitan/core/const/prefs_key.dart';
import 'package:jimpitan/core/helpers/shared_prefs_helper.dart';
import 'package:jimpitan/domain/entities/qr_scan_customer/qr_scan_customer_request.dart';
import 'package:jimpitan/domain/usecases/qr_scan_customer/qr_scan_customer_usecase.dart';
import 'package:jimpitan/presentation/qr_scan_customer/helper/scan_qr_dialogs_helper.dart';
import 'package:jimpitan/presentation/qr_scan_customer/providers/qr_scan_state.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'qr_scan_provider.g.dart';

@riverpod
class QrScanNotifier extends _$QrScanNotifier {
  @override
  QrScanState build() {
    return const QrScanState();
  }

  /// Scan QR code and fetch customer data from API
  /// This method will:
  /// 1. Pause the camera
  /// 2. Show loading dialog
  /// 3. Call API to fetch customer data
  /// 4. Handle success/error cases
  /// 5. Resume camera if needed
  Future<void> scanQrCode({
    required BuildContext context,
    required String qrHash,
    required MobileScannerController cameraController,
  }) async {
    // Prevent multiple simultaneous scans
    if (state.isProcessing) return;

    try {
      // Update state to processing and pause camera
      state = state.copyWith(
        isProcessing: true,
        isLoading: true,
        isCameraPaused: true,
      );

      // Pause camera to prevent multiple scans
      await cameraController.stop();

      // Show loading dialog
      if (context.mounted) {
        ScanQrDialogsHelper.showLoadingDialog(context, 'Memproses QR Code...');
      }

      // Get mobile token from shared preferences
      final prefsHelper = ref.read(sharedPrefsHelperProvider);
      final mobileToken = prefsHelper.getString(PrefsKey.authToken);

      if (mobileToken == null || mobileToken.isEmpty) {
        throw Exception('Token tidak ditemukan. Silakan login kembali.');
      }

      // Create request
      final request = QrScanCustomerRequest(
        action: 'mobileScanQR',
        mobileToken: mobileToken,
        qrHash: qrHash,
      );

      // Call usecase to scan QR
      final usecase = ref.read(qrScanCustomerUsecaseProvider);
      final response = await usecase.call(request);

      // Close loading dialog
      if (context.mounted) {
        Navigator.of(context).pop();
      }

      // Update state with response
      state = state.copyWith(response: response, isLoading: false);

      // Handle response
      if (response.isSuccess && response.data != null) {
        // Show success dialog
        if (context.mounted) {
          ScanQrDialogsHelper.showAttendanceSuccessDialog(context);
        }

        // Reset processing state after successful scan
        state = state.copyWith(isProcessing: false, isCameraPaused: false);
      } else {
        // Show error dialog and retry
        if (context.mounted) {
          ScanQrDialogsHelper.showAttendanceErrorDialog(
            context,
            response.data?.name ?? 'QR Code tidak valid atau sudah kadaluarsa',
            () => _restartCamera(cameraController),
          );
        }

        // Reset state to allow retry
        state = state.copyWith(
          isProcessing: false,
          errorMessage: 'QR Code tidak valid',
        );
      }
    } catch (e) {
      // Close loading dialog if still open
      if (context.mounted) {
        Navigator.of(context).pop();
      }

      // Update state with error
      state = state.copyWith(
        isLoading: false,
        isProcessing: false,
        errorMessage: e.toString(),
      );

      // Show error dialog
      if (context.mounted) {
        ScanQrDialogsHelper.showAttendanceErrorDialog(
          context,
          'Terjadi kesalahan: ${e.toString()}',
          () => _restartCamera(cameraController),
        );
      }
    }
  }

  /// Restart camera after error or cancel
  Future<void> _restartCamera(MobileScannerController controller) async {
    try {
      state = state.copyWith(
        isProcessing: false,
        isCameraPaused: false,
        errorMessage: null,
      );

      await controller.start();
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'Gagal memulai kamera: ${e.toString()}',
      );
    }
  }

  /// Reset state to initial
  void resetState() {
    state = const QrScanState();
  }

  /// Manual camera resume (if needed)
  Future<void> resumeCamera(MobileScannerController controller) async {
    if (!state.isCameraPaused) return;

    try {
      await controller.start();
      state = state.copyWith(isCameraPaused: false, isProcessing: false);
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'Gagal melanjutkan kamera: ${e.toString()}',
      );
    }
  }

  /// Manual camera pause
  Future<void> pauseCamera(MobileScannerController controller) async {
    if (state.isCameraPaused) return;

    try {
      await controller.stop();
      state = state.copyWith(isCameraPaused: true);
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'Gagal menghentikan kamera: ${e.toString()}',
      );
    }
  }
}
