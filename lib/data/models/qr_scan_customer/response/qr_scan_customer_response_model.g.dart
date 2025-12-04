// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_scan_customer_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QrScanCustomerResponseModelImpl _$$QrScanCustomerResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$QrScanCustomerResponseModelImpl(
  status: json['status'] as String?,
  data: json['data'] == null
      ? null
      : QrScanCustomerData.fromJson(json['data'] as Map<String, dynamic>),
  user: json['user'] == null
      ? null
      : QrScanCustomerUser.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$QrScanCustomerResponseModelImplToJson(
  _$QrScanCustomerResponseModelImpl instance,
) => <String, dynamic>{
  'status': instance.status,
  'data': instance.data,
  'user': instance.user,
};

_$QrScanCustomerDataImpl _$$QrScanCustomerDataImplFromJson(
  Map<String, dynamic> json,
) => _$QrScanCustomerDataImpl(
  id: json['id'] as String?,
  block: json['blok'] as String?,
  name: json['nama'],
  qrHash: json['qrHash'] as String?,
  createdAt: json['createdAt'] as String?,
  totalDeposit: (json['totalSetoran'] as num?)?.toInt(),
  lastTransaction: json['lastTransaction'] as String?,
);

Map<String, dynamic> _$$QrScanCustomerDataImplToJson(
  _$QrScanCustomerDataImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'blok': instance.block,
  'nama': instance.name,
  'qrHash': instance.qrHash,
  'createdAt': instance.createdAt,
  'totalSetoran': instance.totalDeposit,
  'lastTransaction': instance.lastTransaction,
};

_$QrScanCustomerUserImpl _$$QrScanCustomerUserImplFromJson(
  Map<String, dynamic> json,
) => _$QrScanCustomerUserImpl(
  id: json['id'] as String?,
  name: json['name'] as String?,
);

Map<String, dynamic> _$$QrScanCustomerUserImplToJson(
  _$QrScanCustomerUserImpl instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};
