import '../../../domain/entities/input/input_nominal_request.dart';
import '../../models/input/input_nominal_model.dart';

class InputNominalRequestMapper {
  static InputNominalRequestModel toModel(InputNominalRequest entity) {
    return InputNominalRequestModel(
      id: entity.id,
      nama: entity.nama,
      nominal: entity.nominal,
      waktu: entity.waktu,
      petugas: entity.petugas,
      username: entity.username,
    );
  }

  static InputNominalRequest toEntity(InputNominalRequestModel model) {
    return InputNominalRequest(
      id: model.id,
      nama: model.nama,
      nominal: model.nominal,
      waktu: model.waktu,
      petugas: model.petugas,
      username: model.username,
    );
  }
}
