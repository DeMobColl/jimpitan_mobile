// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_scan_customer_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QrScanCustomerRequestModelImpl _$$QrScanCustomerRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$QrScanCustomerRequestModelImpl(
  action: json['action'] as String? ?? 'mobileScanQR',
  mobileToken: json['mobileToken'] as String,
  qrHash: json['qrHash'] as String,
);

Map<String, dynamic> _$$QrScanCustomerRequestModelImplToJson(
  _$QrScanCustomerRequestModelImpl instance,
) => <String, dynamic>{
  'action': instance.action,
  'mobileToken': instance.mobileToken,
  'qrHash': instance.qrHash,
};
