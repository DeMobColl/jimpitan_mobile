// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_scan_customer_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QrScanCustomerRequestModel _$QrScanCustomerRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _QrScanCustomerRequestModel.fromJson(json);
}

/// @nodoc
mixin _$QrScanCustomerRequestModel {
  String get action => throw _privateConstructorUsedError;
  String get mobileToken => throw _privateConstructorUsedError;
  String get qrHash => throw _privateConstructorUsedError;

  /// Serializes this QrScanCustomerRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QrScanCustomerRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QrScanCustomerRequestModelCopyWith<QrScanCustomerRequestModel>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrScanCustomerRequestModelCopyWith<$Res> {
  factory $QrScanCustomerRequestModelCopyWith(
    QrScanCustomerRequestModel value,
    $Res Function(QrScanCustomerRequestModel) then,
  ) =
      _$QrScanCustomerRequestModelCopyWithImpl<
        $Res,
        QrScanCustomerRequestModel
      >;
  @useResult
  $Res call({String action, String mobileToken, String qrHash});
}

/// @nodoc
class _$QrScanCustomerRequestModelCopyWithImpl<
  $Res,
  $Val extends QrScanCustomerRequestModel
>
    implements $QrScanCustomerRequestModelCopyWith<$Res> {
  _$QrScanCustomerRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QrScanCustomerRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? mobileToken = null,
    Object? qrHash = null,
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
            qrHash: null == qrHash
                ? _value.qrHash
                : qrHash // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QrScanCustomerRequestModelImplCopyWith<$Res>
    implements $QrScanCustomerRequestModelCopyWith<$Res> {
  factory _$$QrScanCustomerRequestModelImplCopyWith(
    _$QrScanCustomerRequestModelImpl value,
    $Res Function(_$QrScanCustomerRequestModelImpl) then,
  ) = __$$QrScanCustomerRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String action, String mobileToken, String qrHash});
}

/// @nodoc
class __$$QrScanCustomerRequestModelImplCopyWithImpl<$Res>
    extends
        _$QrScanCustomerRequestModelCopyWithImpl<
          $Res,
          _$QrScanCustomerRequestModelImpl
        >
    implements _$$QrScanCustomerRequestModelImplCopyWith<$Res> {
  __$$QrScanCustomerRequestModelImplCopyWithImpl(
    _$QrScanCustomerRequestModelImpl _value,
    $Res Function(_$QrScanCustomerRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QrScanCustomerRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? mobileToken = null,
    Object? qrHash = null,
  }) {
    return _then(
      _$QrScanCustomerRequestModelImpl(
        action: null == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as String,
        mobileToken: null == mobileToken
            ? _value.mobileToken
            : mobileToken // ignore: cast_nullable_to_non_nullable
                  as String,
        qrHash: null == qrHash
            ? _value.qrHash
            : qrHash // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QrScanCustomerRequestModelImpl implements _QrScanCustomerRequestModel {
  const _$QrScanCustomerRequestModelImpl({
    this.action = 'mobileScanQR',
    required this.mobileToken,
    required this.qrHash,
  });

  factory _$QrScanCustomerRequestModelImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$QrScanCustomerRequestModelImplFromJson(json);

  @override
  @JsonKey()
  final String action;
  @override
  final String mobileToken;
  @override
  final String qrHash;

  @override
  String toString() {
    return 'QrScanCustomerRequestModel(action: $action, mobileToken: $mobileToken, qrHash: $qrHash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrScanCustomerRequestModelImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.mobileToken, mobileToken) ||
                other.mobileToken == mobileToken) &&
            (identical(other.qrHash, qrHash) || other.qrHash == qrHash));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, action, mobileToken, qrHash);

  /// Create a copy of QrScanCustomerRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QrScanCustomerRequestModelImplCopyWith<_$QrScanCustomerRequestModelImpl>
  get copyWith =>
      __$$QrScanCustomerRequestModelImplCopyWithImpl<
        _$QrScanCustomerRequestModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QrScanCustomerRequestModelImplToJson(this);
  }
}

abstract class _QrScanCustomerRequestModel
    implements QrScanCustomerRequestModel {
  const factory _QrScanCustomerRequestModel({
    final String action,
    required final String mobileToken,
    required final String qrHash,
  }) = _$QrScanCustomerRequestModelImpl;

  factory _QrScanCustomerRequestModel.fromJson(Map<String, dynamic> json) =
      _$QrScanCustomerRequestModelImpl.fromJson;

  @override
  String get action;
  @override
  String get mobileToken;
  @override
  String get qrHash;

  /// Create a copy of QrScanCustomerRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QrScanCustomerRequestModelImplCopyWith<_$QrScanCustomerRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
