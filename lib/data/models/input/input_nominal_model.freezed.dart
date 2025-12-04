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
  @JsonKey(name: 'action')
  String get action => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobileToken')
  String get mobileToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama')
  String get nama => throw _privateConstructorUsedError;
  @JsonKey(name: 'nominal')
  int get nominal => throw _privateConstructorUsedError;

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
    @JsonKey(name: 'action') String action,
    @JsonKey(name: 'mobileToken') String mobileToken,
    @JsonKey(name: 'customer_id') String customerId,
    @JsonKey(name: 'id') String id,
    @JsonKey(name: 'nama') String nama,
    @JsonKey(name: 'nominal') int nominal,
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
    Object? action = null,
    Object? mobileToken = null,
    Object? customerId = null,
    Object? id = null,
    Object? nama = null,
    Object? nominal = null,
  }) {
    return _then(
      _value.copyWith(
            action: null == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as String,
            mobileToken: null == mobileToken
                ? _value.mobileToken
                : mobileToken // ignore: cast_nullable_to_non_nullable
                      as String,
            customerId: null == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                      as String,
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
                      as int,
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
    @JsonKey(name: 'action') String action,
    @JsonKey(name: 'mobileToken') String mobileToken,
    @JsonKey(name: 'customer_id') String customerId,
    @JsonKey(name: 'id') String id,
    @JsonKey(name: 'nama') String nama,
    @JsonKey(name: 'nominal') int nominal,
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
    Object? action = null,
    Object? mobileToken = null,
    Object? customerId = null,
    Object? id = null,
    Object? nama = null,
    Object? nominal = null,
  }) {
    return _then(
      _$InputNominalRequestModelImpl(
        action: null == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as String,
        mobileToken: null == mobileToken
            ? _value.mobileToken
            : mobileToken // ignore: cast_nullable_to_non_nullable
                  as String,
        customerId: null == customerId
            ? _value.customerId
            : customerId // ignore: cast_nullable_to_non_nullable
                  as String,
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
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InputNominalRequestModelImpl implements _InputNominalRequestModel {
  const _$InputNominalRequestModelImpl({
    @JsonKey(name: 'action') this.action = 'mobileSubmitTransaction',
    @JsonKey(name: 'mobileToken') required this.mobileToken,
    @JsonKey(name: 'customer_id') required this.customerId,
    @JsonKey(name: 'id') required this.id,
    @JsonKey(name: 'nama') required this.nama,
    @JsonKey(name: 'nominal') required this.nominal,
  });

  factory _$InputNominalRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InputNominalRequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'action')
  final String action;
  @override
  @JsonKey(name: 'mobileToken')
  final String mobileToken;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'nama')
  final String nama;
  @override
  @JsonKey(name: 'nominal')
  final int nominal;

  @override
  String toString() {
    return 'InputNominalRequestModel(action: $action, mobileToken: $mobileToken, customerId: $customerId, id: $id, nama: $nama, nominal: $nominal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputNominalRequestModelImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.mobileToken, mobileToken) ||
                other.mobileToken == mobileToken) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.nominal, nominal) || other.nominal == nominal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    action,
    mobileToken,
    customerId,
    id,
    nama,
    nominal,
  );

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
    @JsonKey(name: 'action') final String action,
    @JsonKey(name: 'mobileToken') required final String mobileToken,
    @JsonKey(name: 'customer_id') required final String customerId,
    @JsonKey(name: 'id') required final String id,
    @JsonKey(name: 'nama') required final String nama,
    @JsonKey(name: 'nominal') required final int nominal,
  }) = _$InputNominalRequestModelImpl;

  factory _InputNominalRequestModel.fromJson(Map<String, dynamic> json) =
      _$InputNominalRequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'action')
  String get action;
  @override
  @JsonKey(name: 'mobileToken')
  String get mobileToken;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'nama')
  String get nama;
  @override
  @JsonKey(name: 'nominal')
  int get nominal;

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
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  InputNominalDataModel? get data => throw _privateConstructorUsedError;

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
  $Res call({
    @JsonKey(name: 'status') String status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') InputNominalDataModel? data,
  });

  $InputNominalDataModelCopyWith<$Res>? get data;
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
                      as InputNominalDataModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of InputNominalResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputNominalDataModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $InputNominalDataModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
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
  $Res call({
    @JsonKey(name: 'status') String status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') InputNominalDataModel? data,
  });

  @override
  $InputNominalDataModelCopyWith<$Res>? get data;
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
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as InputNominalDataModel?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InputNominalResponseModelImpl implements _InputNominalResponseModel {
  const _$InputNominalResponseModelImpl({
    @JsonKey(name: 'status') required this.status,
    @JsonKey(name: 'message') this.message,
    @JsonKey(name: 'data') this.data,
  });

  factory _$InputNominalResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InputNominalResponseModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'data')
  final InputNominalDataModel? data;

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
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

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
    @JsonKey(name: 'status') required final String status,
    @JsonKey(name: 'message') final String? message,
    @JsonKey(name: 'data') final InputNominalDataModel? data,
  }) = _$InputNominalResponseModelImpl;

  factory _InputNominalResponseModel.fromJson(Map<String, dynamic> json) =
      _$InputNominalResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  InputNominalDataModel? get data;

  /// Create a copy of InputNominalResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InputNominalResponseModelImplCopyWith<_$InputNominalResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

InputNominalDataModel _$InputNominalDataModelFromJson(
  Map<String, dynamic> json,
) {
  return _InputNominalDataModel.fromJson(json);
}

/// @nodoc
mixin _$InputNominalDataModel {
  @JsonKey(name: 'txid')
  String get txid => throw _privateConstructorUsedError;
  @JsonKey(name: 'timestamp')
  String get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'blok')
  String get blok => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama')
  String get nama => throw _privateConstructorUsedError;
  @JsonKey(name: 'nominal')
  int get nominal => throw _privateConstructorUsedError;
  @JsonKey(name: 'petugas')
  String get petugas => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;

  /// Serializes this InputNominalDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InputNominalDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InputNominalDataModelCopyWith<InputNominalDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputNominalDataModelCopyWith<$Res> {
  factory $InputNominalDataModelCopyWith(
    InputNominalDataModel value,
    $Res Function(InputNominalDataModel) then,
  ) = _$InputNominalDataModelCopyWithImpl<$Res, InputNominalDataModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'txid') String txid,
    @JsonKey(name: 'timestamp') String timestamp,
    @JsonKey(name: 'customer_id') String customerId,
    @JsonKey(name: 'blok') String blok,
    @JsonKey(name: 'nama') String nama,
    @JsonKey(name: 'nominal') int nominal,
    @JsonKey(name: 'petugas') String petugas,
    @JsonKey(name: 'user_id') String userId,
  });
}

/// @nodoc
class _$InputNominalDataModelCopyWithImpl<
  $Res,
  $Val extends InputNominalDataModel
>
    implements $InputNominalDataModelCopyWith<$Res> {
  _$InputNominalDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InputNominalDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? txid = null,
    Object? timestamp = null,
    Object? customerId = null,
    Object? blok = null,
    Object? nama = null,
    Object? nominal = null,
    Object? petugas = null,
    Object? userId = null,
  }) {
    return _then(
      _value.copyWith(
            txid: null == txid
                ? _value.txid
                : txid // ignore: cast_nullable_to_non_nullable
                      as String,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as String,
            customerId: null == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                      as String,
            blok: null == blok
                ? _value.blok
                : blok // ignore: cast_nullable_to_non_nullable
                      as String,
            nama: null == nama
                ? _value.nama
                : nama // ignore: cast_nullable_to_non_nullable
                      as String,
            nominal: null == nominal
                ? _value.nominal
                : nominal // ignore: cast_nullable_to_non_nullable
                      as int,
            petugas: null == petugas
                ? _value.petugas
                : petugas // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InputNominalDataModelImplCopyWith<$Res>
    implements $InputNominalDataModelCopyWith<$Res> {
  factory _$$InputNominalDataModelImplCopyWith(
    _$InputNominalDataModelImpl value,
    $Res Function(_$InputNominalDataModelImpl) then,
  ) = __$$InputNominalDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'txid') String txid,
    @JsonKey(name: 'timestamp') String timestamp,
    @JsonKey(name: 'customer_id') String customerId,
    @JsonKey(name: 'blok') String blok,
    @JsonKey(name: 'nama') String nama,
    @JsonKey(name: 'nominal') int nominal,
    @JsonKey(name: 'petugas') String petugas,
    @JsonKey(name: 'user_id') String userId,
  });
}

/// @nodoc
class __$$InputNominalDataModelImplCopyWithImpl<$Res>
    extends
        _$InputNominalDataModelCopyWithImpl<$Res, _$InputNominalDataModelImpl>
    implements _$$InputNominalDataModelImplCopyWith<$Res> {
  __$$InputNominalDataModelImplCopyWithImpl(
    _$InputNominalDataModelImpl _value,
    $Res Function(_$InputNominalDataModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InputNominalDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? txid = null,
    Object? timestamp = null,
    Object? customerId = null,
    Object? blok = null,
    Object? nama = null,
    Object? nominal = null,
    Object? petugas = null,
    Object? userId = null,
  }) {
    return _then(
      _$InputNominalDataModelImpl(
        txid: null == txid
            ? _value.txid
            : txid // ignore: cast_nullable_to_non_nullable
                  as String,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as String,
        customerId: null == customerId
            ? _value.customerId
            : customerId // ignore: cast_nullable_to_non_nullable
                  as String,
        blok: null == blok
            ? _value.blok
            : blok // ignore: cast_nullable_to_non_nullable
                  as String,
        nama: null == nama
            ? _value.nama
            : nama // ignore: cast_nullable_to_non_nullable
                  as String,
        nominal: null == nominal
            ? _value.nominal
            : nominal // ignore: cast_nullable_to_non_nullable
                  as int,
        petugas: null == petugas
            ? _value.petugas
            : petugas // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InputNominalDataModelImpl implements _InputNominalDataModel {
  const _$InputNominalDataModelImpl({
    @JsonKey(name: 'txid') required this.txid,
    @JsonKey(name: 'timestamp') required this.timestamp,
    @JsonKey(name: 'customer_id') required this.customerId,
    @JsonKey(name: 'blok') required this.blok,
    @JsonKey(name: 'nama') required this.nama,
    @JsonKey(name: 'nominal') required this.nominal,
    @JsonKey(name: 'petugas') required this.petugas,
    @JsonKey(name: 'user_id') required this.userId,
  });

  factory _$InputNominalDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InputNominalDataModelImplFromJson(json);

  @override
  @JsonKey(name: 'txid')
  final String txid;
  @override
  @JsonKey(name: 'timestamp')
  final String timestamp;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  @JsonKey(name: 'blok')
  final String blok;
  @override
  @JsonKey(name: 'nama')
  final String nama;
  @override
  @JsonKey(name: 'nominal')
  final int nominal;
  @override
  @JsonKey(name: 'petugas')
  final String petugas;
  @override
  @JsonKey(name: 'user_id')
  final String userId;

  @override
  String toString() {
    return 'InputNominalDataModel(txid: $txid, timestamp: $timestamp, customerId: $customerId, blok: $blok, nama: $nama, nominal: $nominal, petugas: $petugas, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputNominalDataModelImpl &&
            (identical(other.txid, txid) || other.txid == txid) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.blok, blok) || other.blok == blok) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.nominal, nominal) || other.nominal == nominal) &&
            (identical(other.petugas, petugas) || other.petugas == petugas) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    txid,
    timestamp,
    customerId,
    blok,
    nama,
    nominal,
    petugas,
    userId,
  );

  /// Create a copy of InputNominalDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InputNominalDataModelImplCopyWith<_$InputNominalDataModelImpl>
  get copyWith =>
      __$$InputNominalDataModelImplCopyWithImpl<_$InputNominalDataModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InputNominalDataModelImplToJson(this);
  }
}

abstract class _InputNominalDataModel implements InputNominalDataModel {
  const factory _InputNominalDataModel({
    @JsonKey(name: 'txid') required final String txid,
    @JsonKey(name: 'timestamp') required final String timestamp,
    @JsonKey(name: 'customer_id') required final String customerId,
    @JsonKey(name: 'blok') required final String blok,
    @JsonKey(name: 'nama') required final String nama,
    @JsonKey(name: 'nominal') required final int nominal,
    @JsonKey(name: 'petugas') required final String petugas,
    @JsonKey(name: 'user_id') required final String userId,
  }) = _$InputNominalDataModelImpl;

  factory _InputNominalDataModel.fromJson(Map<String, dynamic> json) =
      _$InputNominalDataModelImpl.fromJson;

  @override
  @JsonKey(name: 'txid')
  String get txid;
  @override
  @JsonKey(name: 'timestamp')
  String get timestamp;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  @JsonKey(name: 'blok')
  String get blok;
  @override
  @JsonKey(name: 'nama')
  String get nama;
  @override
  @JsonKey(name: 'nominal')
  int get nominal;
  @override
  @JsonKey(name: 'petugas')
  String get petugas;
  @override
  @JsonKey(name: 'user_id')
  String get userId;

  /// Create a copy of InputNominalDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InputNominalDataModelImplCopyWith<_$InputNominalDataModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
