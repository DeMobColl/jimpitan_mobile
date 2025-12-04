// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_nominal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InputNominalRequestModelImpl _$$InputNominalRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$InputNominalRequestModelImpl(
  action: json['action'] as String? ?? 'mobileSubmitTransaction',
  mobileToken: json['mobileToken'] as String,
  customerId: json['customer_id'] as String,
  id: json['id'] as String,
  nama: json['nama'] as String,
  nominal: (json['nominal'] as num).toInt(),
);

Map<String, dynamic> _$$InputNominalRequestModelImplToJson(
  _$InputNominalRequestModelImpl instance,
) => <String, dynamic>{
  'action': instance.action,
  'mobileToken': instance.mobileToken,
  'customer_id': instance.customerId,
  'id': instance.id,
  'nama': instance.nama,
  'nominal': instance.nominal,
};

_$InputNominalResponseModelImpl _$$InputNominalResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$InputNominalResponseModelImpl(
  status: json['status'] as String,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : InputNominalDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$InputNominalResponseModelImplToJson(
  _$InputNominalResponseModelImpl instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_$InputNominalDataModelImpl _$$InputNominalDataModelImplFromJson(
  Map<String, dynamic> json,
) => _$InputNominalDataModelImpl(
  txid: json['txid'] as String,
  timestamp: json['timestamp'] as String,
  customerId: json['customer_id'] as String,
  blok: json['blok'] as String,
  nama: json['nama'] as String,
  nominal: (json['nominal'] as num).toInt(),
  petugas: json['petugas'] as String,
  userId: json['user_id'] as String,
);

Map<String, dynamic> _$$InputNominalDataModelImplToJson(
  _$InputNominalDataModelImpl instance,
) => <String, dynamic>{
  'txid': instance.txid,
  'timestamp': instance.timestamp,
  'customer_id': instance.customerId,
  'blok': instance.blok,
  'nama': instance.nama,
  'nominal': instance.nominal,
  'petugas': instance.petugas,
  'user_id': instance.userId,
};
