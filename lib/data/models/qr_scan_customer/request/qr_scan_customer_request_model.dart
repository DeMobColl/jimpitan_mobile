import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_scan_customer_request_model.freezed.dart';
part 'qr_scan_customer_request_model.g.dart';

@freezed
abstract class QrScanCustomerRequestModel with _$QrScanCustomerRequestModel {
  const factory QrScanCustomerRequestModel({
    @Default('mobileScanQR') String action,
    required String mobileToken,
    required String qrHash,
  }) = _QrScanCustomerRequestModel;

  factory QrScanCustomerRequestModel.fromJson(Map<String, dynamic> json) =>
      _$QrScanCustomerRequestModelFromJson(json);
}
