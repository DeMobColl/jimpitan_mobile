import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jimpitan/domain/entities/qr_scan_customer/qr_scan_customer_response.dart';

part 'qr_scan_state.freezed.dart';

@freezed
class QrScanState with _$QrScanState {
  const factory QrScanState({
    @Default(false) bool isLoading,
    @Default(false) bool isProcessing,
    @Default(false) bool isCameraPaused,
    QrScanCustomerResponse? response,
    String? errorMessage,
  }) = _QrScanState;
}
