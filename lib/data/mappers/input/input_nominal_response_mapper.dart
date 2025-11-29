import '../../../domain/entities/input/input_nominal_response.dart';
import '../../models/input/input_nominal_model.dart';

class InputNominalResponseMapper {
  static InputNominalResponse toEntity(InputNominalResponseModel model) {
    return InputNominalResponse(
      status: model.status,
      message: model.message,
      data: model.data,
    );
  }

  static InputNominalResponseModel toModel(InputNominalResponse entity) {
    return InputNominalResponseModel(
      status: entity.status,
      message: entity.message,
      data: entity.data,
    );
  }
}
