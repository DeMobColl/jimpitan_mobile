import '../../../domain/entities/auth/auth_response.dart';
import '../../models/auth/auth_model.dart';
import 'auth_user_mapper.dart';

class AuthResponseMapper {
  static AuthResponse toEntity(AuthResponseModel model) {
    return AuthResponse(
      status: model.status,
      message: model.message,
      data: model.data != null ? AuthUserMapper.toEntity(model.data!) : null,
    );
  }

  static AuthResponseModel toModel(AuthResponse entity) {
    return AuthResponseModel(
      status: entity.status,
      message: entity.message,
      data: entity.data != null ? AuthUserMapper.toModel(entity.data!) : null,
    );
  }
}
