import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class AuthRequestModel with _$AuthRequestModel {
  const factory AuthRequestModel({
    @Default('mobileLogin') String action,
    required String username,
    required String password,
  }) = _AuthRequestModel;

  factory AuthRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestModelFromJson(json);
}

@freezed
class AuthUserModel with _$AuthUserModel {
  const factory AuthUserModel({
    required String id,
    required String name,
    required String role,
    required String username,
    required String mobileToken,
    required String tokenExpiry,
    required String lastLogin,
  }) = _AuthUserModel;

  factory AuthUserModel.fromJson(Map<String, dynamic> json) =>
      _$AuthUserModelFromJson(json);
}

@freezed
class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    required String status,
    String? message,
    AuthUserModel? data,
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
}

// Extension to add helper methods
extension AuthResponseModelX on AuthResponseModel {
  bool get isSuccess => status.toLowerCase() == 'success';
}
