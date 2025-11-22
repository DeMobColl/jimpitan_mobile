// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'input_nominal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

InputNominalRequestModel _$InputNominalRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _InputNominalRequestModel.fromJson(json);
}

/// @nodoc
mixin _$InputNominalRequestModel {
  String get id => throw _privateConstructorUsedError;
  String get nama => throw _privateConstructorUsedError;
  String get nominal => throw _privateConstructorUsedError;
  String get waktu => throw _privateConstructorUsedError;
  String get petugas => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  /// Serializes this InputNominalRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InputNominalRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InputNominalRequestModelCopyWith<InputNominalRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputNominalRequestModelCopyWith<$Res> {
  factory $InputNominalRequestModelCopyWith(
    InputNominalRequestModel value,
    $Res Function(InputNominalRequestModel) then,
  ) = _$InputNominalRequestModelCopyWithImpl<$Res, InputNominalRequestModel>;
  @useResult
  $Res call({
    String id,
    String nama,
    String nominal,
    String waktu,
    String petugas,
    String username,
  });
}

/// @nodoc
class _$InputNominalRequestModelCopyWithImpl<
  $Res,
  $Val extends InputNominalRequestModel
>
    implements $InputNominalRequestModelCopyWith<$Res> {
  _$InputNominalRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InputNominalRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? nominal = null,
    Object? waktu = null,
    Object? petugas = null,
    Object? username = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            nama: null == nama
                ? _value.nama
                : nama // ignore: cast_nullable_to_non_nullable
                      as String,
            nominal: null == nominal
                ? _value.nominal
                : nominal // ignore: cast_nullable_to_non_nullable
                      as String,
            waktu: null == waktu
                ? _value.waktu
                : waktu // ignore: cast_nullable_to_non_nullable
                      as String,
            petugas: null == petugas
                ? _value.petugas
                : petugas // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InputNominalRequestModelImplCopyWith<$Res>
    implements $InputNominalRequestModelCopyWith<$Res> {
  factory _$$InputNominalRequestModelImplCopyWith(
    _$InputNominalRequestModelImpl value,
    $Res Function(_$InputNominalRequestModelImpl) then,
  ) = __$$InputNominalRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String nama,
    String nominal,
    String waktu,
    String petugas,
    String username,
  });
}

/// @nodoc
class __$$InputNominalRequestModelImplCopyWithImpl<$Res>
    extends
        _$InputNominalRequestModelCopyWithImpl<
          $Res,
          _$InputNominalRequestModelImpl
        >
    implements _$$InputNominalRequestModelImplCopyWith<$Res> {
  __$$InputNominalRequestModelImplCopyWithImpl(
    _$InputNominalRequestModelImpl _value,
    $Res Function(_$InputNominalRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InputNominalRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? nominal = null,
    Object? waktu = null,
    Object? petugas = null,
    Object? username = null,
  }) {
    return _then(
      _$InputNominalRequestModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        nama: null == nama
            ? _value.nama
            : nama // ignore: cast_nullable_to_non_nullable
                  as String,
        nominal: null == nominal
            ? _value.nominal
            : nominal // ignore: cast_nullable_to_non_nullable
                  as String,
        waktu: null == waktu
            ? _value.waktu
            : waktu // ignore: cast_nullable_to_non_nullable
                  as String,
        petugas: null == petugas
            ? _value.petugas
            : petugas // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InputNominalRequestModelImpl implements _InputNominalRequestModel {
  const _$InputNominalRequestModelImpl({
    required this.id,
    required this.nama,
    required this.nominal,
    required this.waktu,
    required this.petugas,
    required this.username,
  });

  factory _$InputNominalRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InputNominalRequestModelImplFromJson(json);

  @override
  final String id;
  @override
  final String nama;
  @override
  final String nominal;
  @override
  final String waktu;
  @override
  final String petugas;
  @override
  final String username;

  @override
  String toString() {
    return 'InputNominalRequestModel(id: $id, nama: $nama, nominal: $nominal, waktu: $waktu, petugas: $petugas, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputNominalRequestModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.nominal, nominal) || other.nominal == nominal) &&
            (identical(other.waktu, waktu) || other.waktu == waktu) &&
            (identical(other.petugas, petugas) || other.petugas == petugas) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nama, nominal, waktu, petugas, username);

  /// Create a copy of InputNominalRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InputNominalRequestModelImplCopyWith<_$InputNominalRequestModelImpl>
  get copyWith =>
      __$$InputNominalRequestModelImplCopyWithImpl<
        _$InputNominalRequestModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InputNominalRequestModelImplToJson(this);
  }
}

abstract class _InputNominalRequestModel implements InputNominalRequestModel {
  const factory _InputNominalRequestModel({
    required final String id,
    required final String nama,
    required final String nominal,
    required final String waktu,
    required final String petugas,
    required final String username,
  }) = _$InputNominalRequestModelImpl;

  factory _InputNominalRequestModel.fromJson(Map<String, dynamic> json) =
      _$InputNominalRequestModelImpl.fromJson;

  @override
  String get id;
  @override
  String get nama;
  @override
  String get nominal;
  @override
  String get waktu;
  @override
  String get petugas;
  @override
  String get username;

  /// Create a copy of InputNominalRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InputNominalRequestModelImplCopyWith<_$InputNominalRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

InputNominalResponseModel _$InputNominalResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _InputNominalResponseModel.fromJson(json);
}

/// @nodoc
mixin _$InputNominalResponseModel {
  String get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;

  /// Serializes this InputNominalResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InputNominalResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InputNominalResponseModelCopyWith<InputNominalResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputNominalResponseModelCopyWith<$Res> {
  factory $InputNominalResponseModelCopyWith(
    InputNominalResponseModel value,
    $Res Function(InputNominalResponseModel) then,
  ) = _$InputNominalResponseModelCopyWithImpl<$Res, InputNominalResponseModel>;
  @useResult
  $Res call({String status, String? message, Map<String, dynamic>? data});
}

/// @nodoc
class _$InputNominalResponseModelCopyWithImpl<
  $Res,
  $Val extends InputNominalResponseModel
>
    implements $InputNominalResponseModelCopyWith<$Res> {
  _$InputNominalResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InputNominalResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InputNominalResponseModelImplCopyWith<$Res>
    implements $InputNominalResponseModelCopyWith<$Res> {
  factory _$$InputNominalResponseModelImplCopyWith(
    _$InputNominalResponseModelImpl value,
    $Res Function(_$InputNominalResponseModelImpl) then,
  ) = __$$InputNominalResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String? message, Map<String, dynamic>? data});
}

/// @nodoc
class __$$InputNominalResponseModelImplCopyWithImpl<$Res>
    extends
        _$InputNominalResponseModelCopyWithImpl<
          $Res,
          _$InputNominalResponseModelImpl
        >
    implements _$$InputNominalResponseModelImplCopyWith<$Res> {
  __$$InputNominalResponseModelImplCopyWithImpl(
    _$InputNominalResponseModelImpl _value,
    $Res Function(_$InputNominalResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InputNominalResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _$InputNominalResponseModelImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        data: freezed == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InputNominalResponseModelImpl implements _InputNominalResponseModel {
  const _$InputNominalResponseModelImpl({
    required this.status,
    this.message,
    final Map<String, dynamic>? data,
  }) : _data = data;

  factory _$InputNominalResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InputNominalResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final String? message;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'InputNominalResponseModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputNominalResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    message,
    const DeepCollectionEquality().hash(_data),
  );

  /// Create a copy of InputNominalResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InputNominalResponseModelImplCopyWith<_$InputNominalResponseModelImpl>
  get copyWith =>
      __$$InputNominalResponseModelImplCopyWithImpl<
        _$InputNominalResponseModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InputNominalResponseModelImplToJson(this);
  }
}

abstract class _InputNominalResponseModel implements InputNominalResponseModel {
  const factory _InputNominalResponseModel({
    required final String status,
    final String? message,
    final Map<String, dynamic>? data,
  }) = _$InputNominalResponseModelImpl;

  factory _InputNominalResponseModel.fromJson(Map<String, dynamic> json) =
      _$InputNominalResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  String? get message;
  @override
  Map<String, dynamic>? get data;

  /// Create a copy of InputNominalResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InputNominalResponseModelImplCopyWith<_$InputNominalResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
