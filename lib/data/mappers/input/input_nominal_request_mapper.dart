import '../../../domain/entities/input/input_nominal_request.dart';
import '../../models/input/input_nominal_model.dart';

class InputNominalRequestMapper {
  static InputNominalRequestModel toModel(InputNominalRequest entity) {
    return InputNominalRequestModel(
      action: entity.action,
      mobileToken: entity.mobileToken,
      customerId: entity.customerId,
      id: entity.id,
      nama: entity.nama,
      nominal: entity.nominal,
    );
  }

  static InputNominalRequest toEntity(InputNominalRequestModel model) {
    return InputNominalRequest(
      action: model.action,
      mobileToken: model.mobileToken,
      customerId: model.customerId,
      id: model.id,
      nama: model.nama,
      nominal: model.nominal,
    );
  }
}
