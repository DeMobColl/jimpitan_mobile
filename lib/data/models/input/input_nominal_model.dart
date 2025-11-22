import 'package:freezed_annotation/freezed_annotation.dart';

part 'input_nominal_model.freezed.dart';
part 'input_nominal_model.g.dart';

@freezed
class InputNominalRequestModel with _$InputNominalRequestModel {
  const factory InputNominalRequestModel({
    required String id,
    required String nama,
    required String nominal,
    required String waktu,
    required String petugas,
    required String username,
  }) = _InputNominalRequestModel;

  factory InputNominalRequestModel.fromJson(Map<String, dynamic> json) =>
      _$InputNominalRequestModelFromJson(json);
}

@freezed
class InputNominalResponseModel with _$InputNominalResponseModel {
  const factory InputNominalResponseModel({
    required String status,
    String? message,
    Map<String, dynamic>? data,
  }) = _InputNominalResponseModel;

  factory InputNominalResponseModel.fromJson(Map<String, dynamic> json) =>
      _$InputNominalResponseModelFromJson(json);
}

// Extension to add helper method
extension InputNominalResponseModelX on InputNominalResponseModel {
  bool get isSuccess => status.toLowerCase() == 'success';
}
