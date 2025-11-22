// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_nominal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InputNominalRequestModelImpl _$$InputNominalRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$InputNominalRequestModelImpl(
  id: json['id'] as String,
  nama: json['nama'] as String,
  nominal: json['nominal'] as String,
  waktu: json['waktu'] as String,
  petugas: json['petugas'] as String,
  username: json['username'] as String,
);

Map<String, dynamic> _$$InputNominalRequestModelImplToJson(
  _$InputNominalRequestModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'nama': instance.nama,
  'nominal': instance.nominal,
  'waktu': instance.waktu,
  'petugas': instance.petugas,
  'username': instance.username,
};

_$InputNominalResponseModelImpl _$$InputNominalResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$InputNominalResponseModelImpl(
  status: json['status'] as String,
  message: json['message'] as String?,
  data: json['data'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$InputNominalResponseModelImplToJson(
  _$InputNominalResponseModelImpl instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
