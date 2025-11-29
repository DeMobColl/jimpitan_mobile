import '../../../domain/entities/auth/auth_request.dart';
import '../../models/auth/auth_model.dart';

class AuthRequestMapper {
  static AuthRequestModel toModel(AuthRequest entity) {
    return AuthRequestModel(
      username: entity.username,
      password: entity.password,
    );
  }

  static AuthRequest toEntity(AuthRequestModel model) {
    return AuthRequest(username: model.username, password: model.password);
  }
}
