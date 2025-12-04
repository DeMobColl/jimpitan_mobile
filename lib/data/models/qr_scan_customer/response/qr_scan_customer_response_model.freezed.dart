// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_scan_customer_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QrScanCustomerResponseModel _$QrScanCustomerResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _QrScanCustomerResponseModel.fromJson(json);
}

/// @nodoc
mixin _$QrScanCustomerResponseModel {
  String? get status => throw _privateConstructorUsedError;
  QrScanCustomerData? get data => throw _privateConstructorUsedError;
  QrScanCustomerUser? get user => throw _privateConstructorUsedError;

  /// Serializes this QrScanCustomerResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QrScanCustomerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QrScanCustomerResponseModelCopyWith<QrScanCustomerResponseModel>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrScanCustomerResponseModelCopyWith<$Res> {
  factory $QrScanCustomerResponseModelCopyWith(
    QrScanCustomerResponseModel value,
    $Res Function(QrScanCustomerResponseModel) then,
  ) =
      _$QrScanCustomerResponseModelCopyWithImpl<
        $Res,
        QrScanCustomerResponseModel
      >;
  @useResult
  $Res call({
    String? status,
    QrScanCustomerData? data,
    QrScanCustomerUser? user,
  });

  $QrScanCustomerDataCopyWith<$Res>? get data;
  $QrScanCustomerUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$QrScanCustomerResponseModelCopyWithImpl<
  $Res,
  $Val extends QrScanCustomerResponseModel
>
    implements $QrScanCustomerResponseModelCopyWith<$Res> {
  _$QrScanCustomerResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QrScanCustomerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? user = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as QrScanCustomerData?,
            user: freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as QrScanCustomerUser?,
          )
          as $Val,
    );
  }

  /// Create a copy of QrScanCustomerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QrScanCustomerDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $QrScanCustomerDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }

  /// Create a copy of QrScanCustomerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QrScanCustomerUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $QrScanCustomerUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QrScanCustomerResponseModelImplCopyWith<$Res>
    implements $QrScanCustomerResponseModelCopyWith<$Res> {
  factory _$$QrScanCustomerResponseModelImplCopyWith(
    _$QrScanCustomerResponseModelImpl value,
    $Res Function(_$QrScanCustomerResponseModelImpl) then,
  ) = __$$QrScanCustomerResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? status,
    QrScanCustomerData? data,
    QrScanCustomerUser? user,
  });

  @override
  $QrScanCustomerDataCopyWith<$Res>? get data;
  @override
  $QrScanCustomerUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$QrScanCustomerResponseModelImplCopyWithImpl<$Res>
    extends
        _$QrScanCustomerResponseModelCopyWithImpl<
          $Res,
          _$QrScanCustomerResponseModelImpl
        >
    implements _$$QrScanCustomerResponseModelImplCopyWith<$Res> {
  __$$QrScanCustomerResponseModelImplCopyWithImpl(
    _$QrScanCustomerResponseModelImpl _value,
    $Res Function(_$QrScanCustomerResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QrScanCustomerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? user = freezed,
  }) {
    return _then(
      _$QrScanCustomerResponseModelImpl(
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as QrScanCustomerData?,
        user: freezed == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as QrScanCustomerUser?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QrScanCustomerResponseModelImpl
    implements _QrScanCustomerResponseModel {
  const _$QrScanCustomerResponseModelImpl({
    required this.status,
    required this.data,
    required this.user,
  });

  factory _$QrScanCustomerResponseModelImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$QrScanCustomerResponseModelImplFromJson(json);

  @override
  final String? status;
  @override
  final QrScanCustomerData? data;
  @override
  final QrScanCustomerUser? user;

  @override
  String toString() {
    return 'QrScanCustomerResponseModel(status: $status, data: $data, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrScanCustomerResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, data, user);

  /// Create a copy of QrScanCustomerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QrScanCustomerResponseModelImplCopyWith<_$QrScanCustomerResponseModelImpl>
  get copyWith =>
      __$$QrScanCustomerResponseModelImplCopyWithImpl<
        _$QrScanCustomerResponseModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QrScanCustomerResponseModelImplToJson(this);
  }
}

abstract class _QrScanCustomerResponseModel
    implements QrScanCustomerResponseModel {
  const factory _QrScanCustomerResponseModel({
    required final String? status,
    required final QrScanCustomerData? data,
    required final QrScanCustomerUser? user,
  }) = _$QrScanCustomerResponseModelImpl;

  factory _QrScanCustomerResponseModel.fromJson(Map<String, dynamic> json) =
      _$QrScanCustomerResponseModelImpl.fromJson;

  @override
  String? get status;
  @override
  QrScanCustomerData? get data;
  @override
  QrScanCustomerUser? get user;

  /// Create a copy of QrScanCustomerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QrScanCustomerResponseModelImplCopyWith<_$QrScanCustomerResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

QrScanCustomerData _$QrScanCustomerDataFromJson(Map<String, dynamic> json) {
  return _QrScanCustomerData.fromJson(json);
}

/// @nodoc
mixin _$QrScanCustomerData {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'blok')
  String? get block => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama')
  dynamic get name => throw _privateConstructorUsedError;
  String? get qrHash => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalSetoran')
  int? get totalDeposit => throw _privateConstructorUsedError;
  String? get lastTransaction => throw _privateConstructorUsedError;

  /// Serializes this QrScanCustomerData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QrScanCustomerData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QrScanCustomerDataCopyWith<QrScanCustomerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrScanCustomerDataCopyWith<$Res> {
  factory $QrScanCustomerDataCopyWith(
    QrScanCustomerData value,
    $Res Function(QrScanCustomerData) then,
  ) = _$QrScanCustomerDataCopyWithImpl<$Res, QrScanCustomerData>;
  @useResult
  $Res call({
    String? id,
    @JsonKey(name: 'blok') String? block,
    @JsonKey(name: 'nama') dynamic name,
    String? qrHash,
    String? createdAt,
    @JsonKey(name: 'totalSetoran') int? totalDeposit,
    String? lastTransaction,
  });
}

/// @nodoc
class _$QrScanCustomerDataCopyWithImpl<$Res, $Val extends QrScanCustomerData>
    implements $QrScanCustomerDataCopyWith<$Res> {
  _$QrScanCustomerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QrScanCustomerData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? block = freezed,
    Object? name = freezed,
    Object? qrHash = freezed,
    Object? createdAt = freezed,
    Object? totalDeposit = freezed,
    Object? lastTransaction = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            block: freezed == block
                ? _value.block
                : block // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            qrHash: freezed == qrHash
                ? _value.qrHash
                : qrHash // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            totalDeposit: freezed == totalDeposit
                ? _value.totalDeposit
                : totalDeposit // ignore: cast_nullable_to_non_nullable
                      as int?,
            lastTransaction: freezed == lastTransaction
                ? _value.lastTransaction
                : lastTransaction // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QrScanCustomerDataImplCopyWith<$Res>
    implements $QrScanCustomerDataCopyWith<$Res> {
  factory _$$QrScanCustomerDataImplCopyWith(
    _$QrScanCustomerDataImpl value,
    $Res Function(_$QrScanCustomerDataImpl) then,
  ) = __$$QrScanCustomerDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    @JsonKey(name: 'blok') String? block,
    @JsonKey(name: 'nama') dynamic name,
    String? qrHash,
    String? createdAt,
    @JsonKey(name: 'totalSetoran') int? totalDeposit,
    String? lastTransaction,
  });
}

/// @nodoc
class __$$QrScanCustomerDataImplCopyWithImpl<$Res>
    extends _$QrScanCustomerDataCopyWithImpl<$Res, _$QrScanCustomerDataImpl>
    implements _$$QrScanCustomerDataImplCopyWith<$Res> {
  __$$QrScanCustomerDataImplCopyWithImpl(
    _$QrScanCustomerDataImpl _value,
    $Res Function(_$QrScanCustomerDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QrScanCustomerData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? block = freezed,
    Object? name = freezed,
    Object? qrHash = freezed,
    Object? createdAt = freezed,
    Object? totalDeposit = freezed,
    Object? lastTransaction = freezed,
  }) {
    return _then(
      _$QrScanCustomerDataImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        block: freezed == block
            ? _value.block
            : block // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name ? _value.name! : name,
        qrHash: freezed == qrHash
            ? _value.qrHash
            : qrHash // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalDeposit: freezed == totalDeposit
            ? _value.totalDeposit
            : totalDeposit // ignore: cast_nullable_to_non_nullable
                  as int?,
        lastTransaction: freezed == lastTransaction
            ? _value.lastTransaction
            : lastTransaction // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QrScanCustomerDataImpl implements _QrScanCustomerData {
  const _$QrScanCustomerDataImpl({
    required this.id,
    @JsonKey(name: 'blok') this.block,
    @JsonKey(name: 'nama') this.name,
    required this.qrHash,
    required this.createdAt,
    @JsonKey(name: 'totalSetoran') this.totalDeposit,
    required this.lastTransaction,
  });

  factory _$QrScanCustomerDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$QrScanCustomerDataImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'blok')
  final String? block;
  @override
  @JsonKey(name: 'nama')
  final dynamic name;
  @override
  final String? qrHash;
  @override
  final String? createdAt;
  @override
  @JsonKey(name: 'totalSetoran')
  final int? totalDeposit;
  @override
  final String? lastTransaction;

  @override
  String toString() {
    return 'QrScanCustomerData(id: $id, block: $block, name: $name, qrHash: $qrHash, createdAt: $createdAt, totalDeposit: $totalDeposit, lastTransaction: $lastTransaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrScanCustomerDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.block, block) || other.block == block) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            (identical(other.qrHash, qrHash) || other.qrHash == qrHash) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.totalDeposit, totalDeposit) ||
                other.totalDeposit == totalDeposit) &&
            (identical(other.lastTransaction, lastTransaction) ||
                other.lastTransaction == lastTransaction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    block,
    const DeepCollectionEquality().hash(name),
    qrHash,
    createdAt,
    totalDeposit,
    lastTransaction,
  );

  /// Create a copy of QrScanCustomerData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QrScanCustomerDataImplCopyWith<_$QrScanCustomerDataImpl> get copyWith =>
      __$$QrScanCustomerDataImplCopyWithImpl<_$QrScanCustomerDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$QrScanCustomerDataImplToJson(this);
  }
}

abstract class _QrScanCustomerData implements QrScanCustomerData {
  const factory _QrScanCustomerData({
    required final String? id,
    @JsonKey(name: 'blok') final String? block,
    @JsonKey(name: 'nama') final dynamic name,
    required final String? qrHash,
    required final String? createdAt,
    @JsonKey(name: 'totalSetoran') final int? totalDeposit,
    required final String? lastTransaction,
  }) = _$QrScanCustomerDataImpl;

  factory _QrScanCustomerData.fromJson(Map<String, dynamic> json) =
      _$QrScanCustomerDataImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'blok')
  String? get block;
  @override
  @JsonKey(name: 'nama')
  dynamic get name;
  @override
  String? get qrHash;
  @override
  String? get createdAt;
  @override
  @JsonKey(name: 'totalSetoran')
  int? get totalDeposit;
  @override
  String? get lastTransaction;

  /// Create a copy of QrScanCustomerData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QrScanCustomerDataImplCopyWith<_$QrScanCustomerDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QrScanCustomerUser _$QrScanCustomerUserFromJson(Map<String, dynamic> json) {
  return _QrScanCustomerUser.fromJson(json);
}

/// @nodoc
mixin _$QrScanCustomerUser {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this QrScanCustomerUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QrScanCustomerUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QrScanCustomerUserCopyWith<QrScanCustomerUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrScanCustomerUserCopyWith<$Res> {
  factory $QrScanCustomerUserCopyWith(
    QrScanCustomerUser value,
    $Res Function(QrScanCustomerUser) then,
  ) = _$QrScanCustomerUserCopyWithImpl<$Res, QrScanCustomerUser>;
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class _$QrScanCustomerUserCopyWithImpl<$Res, $Val extends QrScanCustomerUser>
    implements $QrScanCustomerUserCopyWith<$Res> {
  _$QrScanCustomerUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QrScanCustomerUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = freezed}) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QrScanCustomerUserImplCopyWith<$Res>
    implements $QrScanCustomerUserCopyWith<$Res> {
  factory _$$QrScanCustomerUserImplCopyWith(
    _$QrScanCustomerUserImpl value,
    $Res Function(_$QrScanCustomerUserImpl) then,
  ) = __$$QrScanCustomerUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$QrScanCustomerUserImplCopyWithImpl<$Res>
    extends _$QrScanCustomerUserCopyWithImpl<$Res, _$QrScanCustomerUserImpl>
    implements _$$QrScanCustomerUserImplCopyWith<$Res> {
  __$$QrScanCustomerUserImplCopyWithImpl(
    _$QrScanCustomerUserImpl _value,
    $Res Function(_$QrScanCustomerUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QrScanCustomerUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = freezed}) {
    return _then(
      _$QrScanCustomerUserImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QrScanCustomerUserImpl implements _QrScanCustomerUser {
  const _$QrScanCustomerUserImpl({required this.id, required this.name});

  factory _$QrScanCustomerUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$QrScanCustomerUserImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'QrScanCustomerUser(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrScanCustomerUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of QrScanCustomerUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QrScanCustomerUserImplCopyWith<_$QrScanCustomerUserImpl> get copyWith =>
      __$$QrScanCustomerUserImplCopyWithImpl<_$QrScanCustomerUserImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$QrScanCustomerUserImplToJson(this);
  }
}

abstract class _QrScanCustomerUser implements QrScanCustomerUser {
  const factory _QrScanCustomerUser({
    required final String? id,
    required final String? name,
  }) = _$QrScanCustomerUserImpl;

  factory _QrScanCustomerUser.fromJson(Map<String, dynamic> json) =
      _$QrScanCustomerUserImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;

  /// Create a copy of QrScanCustomerUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QrScanCustomerUserImplCopyWith<_$QrScanCustomerUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
