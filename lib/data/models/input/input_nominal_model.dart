import 'package:freezed_annotation/freezed_annotation.dart';

part 'input_nominal_model.freezed.dart';
part 'input_nominal_model.g.dart';

@freezed
class InputNominalRequestModel with _$InputNominalRequestModel {
  const factory InputNominalRequestModel({
    @JsonKey(name: 'action') @Default('mobileSubmitTransaction') String action,
    @JsonKey(name: 'mobileToken') required String mobileToken,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'nama') required String nama,
    @JsonKey(name: 'nominal') required int nominal,
  }) = _InputNominalRequestModel;

  factory InputNominalRequestModel.fromJson(Map<String, dynamic> json) =>
      _$InputNominalRequestModelFromJson(json);
}

@freezed
class InputNominalResponseModel with _$InputNominalResponseModel {
  const factory InputNominalResponseModel({
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') InputNominalDataModel? data,
  }) = _InputNominalResponseModel;

  factory InputNominalResponseModel.fromJson(Map<String, dynamic> json) =>
      _$InputNominalResponseModelFromJson(json);
}

@freezed
class InputNominalDataModel with _$InputNominalDataModel {
  const factory InputNominalDataModel({
    @JsonKey(name: 'txid') required String txid,
    @JsonKey(name: 'timestamp') required String timestamp,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'blok') required String blok,
    @JsonKey(name: 'nama') required String nama,
    @JsonKey(name: 'nominal') required int nominal,
    @JsonKey(name: 'petugas') required String petugas,
    @JsonKey(name: 'user_id') required String userId,
  }) = _InputNominalDataModel;

  factory InputNominalDataModel.fromJson(Map<String, dynamic> json) =>
      _$InputNominalDataModelFromJson(json);
}

// Extension to add helper method
extension InputNominalResponseModelX on InputNominalResponseModel {
  bool get isSuccess => status.toLowerCase() == 'success';
}
