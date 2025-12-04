import '../../../domain/entities/input/input_nominal_response.dart';
import '../../models/input/input_nominal_model.dart';

class InputNominalResponseMapper {
  static InputNominalResponse toEntity(InputNominalResponseModel model) {
    return InputNominalResponse(
      status: model.status,
      message: model.message,
      data: model.data != null ? _mapDataToEntity(model.data!) : null,
    );
  }

  static InputNominalResponseModel toModel(InputNominalResponse entity) {
    return InputNominalResponseModel(
      status: entity.status,
      message: entity.message,
      data: entity.data != null ? _mapDataToModel(entity.data!) : null,
    );
  }

  static InputNominalData _mapDataToEntity(InputNominalDataModel model) {
    return InputNominalData(
      txid: model.txid,
      timestamp: model.timestamp,
      customerId: model.customerId,
      blok: model.blok,
      nama: model.nama,
      nominal: model.nominal,
      petugas: model.petugas,
      userId: model.userId,
    );
  }

  static InputNominalDataModel _mapDataToModel(InputNominalData entity) {
    return InputNominalDataModel(
      txid: entity.txid,
      timestamp: entity.timestamp,
      customerId: entity.customerId,
      blok: entity.blok,
      nama: entity.nama,
      nominal: entity.nominal,
      petugas: entity.petugas,
      userId: entity.userId,
    );
  }
}
