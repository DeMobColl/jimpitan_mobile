// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthRequestModelImpl _$$AuthRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$AuthRequestModelImpl(
  username: json['username'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$$AuthRequestModelImplToJson(
  _$AuthRequestModelImpl instance,
) => <String, dynamic>{
  'username': instance.username,
  'password': instance.password,
};

_$AuthUserModelImpl _$$AuthUserModelImplFromJson(Map<String, dynamic> json) =>
    _$AuthUserModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      username: json['username'] as String,
      token: json['token'] as String,
      tokenExpiry: json['tokenExpiry'] as String,
      lastLogin: json['lastLogin'] as String,
    );

Map<String, dynamic> _$$AuthUserModelImplToJson(_$AuthUserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'username': instance.username,
      'token': instance.token,
      'tokenExpiry': instance.tokenExpiry,
      'lastLogin': instance.lastLogin,
    };

_$AuthResponseModelImpl _$$AuthResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$AuthResponseModelImpl(
  status: json['status'] as String,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : AuthUserModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$AuthResponseModelImplToJson(
  _$AuthResponseModelImpl instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
