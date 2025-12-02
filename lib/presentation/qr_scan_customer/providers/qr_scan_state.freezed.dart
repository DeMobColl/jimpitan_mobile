// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_scan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$QrScanState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isProcessing => throw _privateConstructorUsedError;
  bool get isCameraPaused => throw _privateConstructorUsedError;
  QrScanCustomerResponse? get response => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of QrScanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QrScanStateCopyWith<QrScanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrScanStateCopyWith<$Res> {
  factory $QrScanStateCopyWith(
    QrScanState value,
    $Res Function(QrScanState) then,
  ) = _$QrScanStateCopyWithImpl<$Res, QrScanState>;
  @useResult
  $Res call({
    bool isLoading,
    bool isProcessing,
    bool isCameraPaused,
    QrScanCustomerResponse? response,
    String? errorMessage,
  });
}

/// @nodoc
class _$QrScanStateCopyWithImpl<$Res, $Val extends QrScanState>
    implements $QrScanStateCopyWith<$Res> {
  _$QrScanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QrScanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isProcessing = null,
    Object? isCameraPaused = null,
    Object? response = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isProcessing: null == isProcessing
                ? _value.isProcessing
                : isProcessing // ignore: cast_nullable_to_non_nullable
                      as bool,
            isCameraPaused: null == isCameraPaused
                ? _value.isCameraPaused
                : isCameraPaused // ignore: cast_nullable_to_non_nullable
                      as bool,
            response: freezed == response
                ? _value.response
                : response // ignore: cast_nullable_to_non_nullable
                      as QrScanCustomerResponse?,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QrScanStateImplCopyWith<$Res>
    implements $QrScanStateCopyWith<$Res> {
  factory _$$QrScanStateImplCopyWith(
    _$QrScanStateImpl value,
    $Res Function(_$QrScanStateImpl) then,
  ) = __$$QrScanStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    bool isProcessing,
    bool isCameraPaused,
    QrScanCustomerResponse? response,
    String? errorMessage,
  });
}

/// @nodoc
class __$$QrScanStateImplCopyWithImpl<$Res>
    extends _$QrScanStateCopyWithImpl<$Res, _$QrScanStateImpl>
    implements _$$QrScanStateImplCopyWith<$Res> {
  __$$QrScanStateImplCopyWithImpl(
    _$QrScanStateImpl _value,
    $Res Function(_$QrScanStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QrScanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isProcessing = null,
    Object? isCameraPaused = null,
    Object? response = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$QrScanStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isProcessing: null == isProcessing
            ? _value.isProcessing
            : isProcessing // ignore: cast_nullable_to_non_nullable
                  as bool,
        isCameraPaused: null == isCameraPaused
            ? _value.isCameraPaused
            : isCameraPaused // ignore: cast_nullable_to_non_nullable
                  as bool,
        response: freezed == response
            ? _value.response
            : response // ignore: cast_nullable_to_non_nullable
                  as QrScanCustomerResponse?,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$QrScanStateImpl implements _QrScanState {
  const _$QrScanStateImpl({
    this.isLoading = false,
    this.isProcessing = false,
    this.isCameraPaused = false,
    this.response,
    this.errorMessage,
  });

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isProcessing;
  @override
  @JsonKey()
  final bool isCameraPaused;
  @override
  final QrScanCustomerResponse? response;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'QrScanState(isLoading: $isLoading, isProcessing: $isProcessing, isCameraPaused: $isCameraPaused, response: $response, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrScanStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isProcessing, isProcessing) ||
                other.isProcessing == isProcessing) &&
            (identical(other.isCameraPaused, isCameraPaused) ||
                other.isCameraPaused == isCameraPaused) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    isProcessing,
    isCameraPaused,
    response,
    errorMessage,
  );

  /// Create a copy of QrScanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QrScanStateImplCopyWith<_$QrScanStateImpl> get copyWith =>
      __$$QrScanStateImplCopyWithImpl<_$QrScanStateImpl>(this, _$identity);
}

abstract class _QrScanState implements QrScanState {
  const factory _QrScanState({
    final bool isLoading,
    final bool isProcessing,
    final bool isCameraPaused,
    final QrScanCustomerResponse? response,
    final String? errorMessage,
  }) = _$QrScanStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isProcessing;
  @override
  bool get isCameraPaused;
  @override
  QrScanCustomerResponse? get response;
  @override
  String? get errorMessage;

  /// Create a copy of QrScanState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QrScanStateImplCopyWith<_$QrScanStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
