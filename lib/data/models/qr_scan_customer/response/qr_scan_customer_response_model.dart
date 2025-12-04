import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_scan_customer_response_model.freezed.dart';
part 'qr_scan_customer_response_model.g.dart';

@freezed
abstract class QrScanCustomerResponseModel with _$QrScanCustomerResponseModel {
  const factory QrScanCustomerResponseModel({
    required String? status,
    required QrScanCustomerData? data,
    required QrScanCustomerUser? user,
  }) = _QrScanCustomerResponseModel;

  factory QrScanCustomerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QrScanCustomerResponseModelFromJson(json);
}

@freezed
abstract class QrScanCustomerData with _$QrScanCustomerData {
  const factory QrScanCustomerData({
    required String? id,
    @JsonKey(name: 'blok') String? block,
    @JsonKey(name: 'nama') name,
    required String? qrHash,
    required String? createdAt,
    @JsonKey(name: 'totalSetoran') int? totalDeposit,
    required String? lastTransaction,
  }) = _QrScanCustomerData;

  factory QrScanCustomerData.fromJson(Map<String, dynamic> json) =>
      _$QrScanCustomerDataFromJson(json);
}

@freezed
abstract class QrScanCustomerUser with _$QrScanCustomerUser {
  const factory QrScanCustomerUser({
    required String? id,
    required String? name,
  }) = _QrScanCustomerUser;

  factory QrScanCustomerUser.fromJson(Map<String, dynamic> json) =>
      _$QrScanCustomerUserFromJson(json);
}
