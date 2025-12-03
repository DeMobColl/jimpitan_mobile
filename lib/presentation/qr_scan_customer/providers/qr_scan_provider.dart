import 'package:jimpitan/core/const/prefs_key.dart';
import 'package:jimpitan/core/helpers/shared_prefs_helper.dart';
import 'package:jimpitan/domain/entities/qr_scan_customer/qr_scan_customer_request.dart';
import 'package:jimpitan/domain/entities/qr_scan_customer/qr_scan_customer_response.dart';
import 'package:jimpitan/domain/usecases/qr_scan_customer/qr_scan_customer_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'qr_scan_provider.g.dart';

@riverpod
class QrScanNotifier extends _$QrScanNotifier {
  @override
  AsyncValue<QrScanCustomerResponse?> build() {
    return const AsyncValue.data(null);
  }

  /// Scan QR code and fetch customer data from API
  /// This is a pure data operation - UI layer handles dialogs and camera control
  Future<void> scanQrCode(String qrHash) async {
    // Set loading state
    state = const AsyncValue.loading();

    // Get mobile token from shared preferences
    final prefsHelper = ref.read(sharedPrefsHelperProvider);
    final mobileToken = prefsHelper.getString(PrefsKey.authToken);

    if (mobileToken == null || mobileToken.isEmpty) {
      state = AsyncValue.error(
        Exception('Token tidak ditemukan. Silakan login kembali.'),
        StackTrace.current,
      );
      return;
    }

    // Create request
    final request = QrScanCustomerRequest(
      action: 'mobileScanQR',
      mobileToken: mobileToken,
      qrHash: qrHash,
    );

    // Call usecase and update state
    state = await AsyncValue.guard(() async {
      final usecase = ref.read(qrScanCustomerUsecaseProvider);
      return await usecase.call(request);
    });
  }

  /// Reset state to initial
  void reset() {
    state = const AsyncValue.data(null);
  }
}
