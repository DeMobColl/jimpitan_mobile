import '../../../domain/entities/auth/auth_user.dart';
import '../../models/auth/auth_model.dart';

class AuthUserMapper {
  static AuthUser toEntity(AuthUserModel model) {
    return AuthUser(
      id: model.id,
      name: model.name,
      role: model.role,
      username: model.username,
      token: model.token,
      tokenExpiry: model.tokenExpiry,
      lastLogin: model.lastLogin,
    );
  }

  static AuthUserModel toModel(AuthUser entity) {
    return AuthUserModel(
      id: entity.id,
      name: entity.name,
      role: entity.role,
      username: entity.username,
      token: entity.token,
      tokenExpiry: entity.tokenExpiry,
      lastLogin: entity.lastLogin,
    );
  }
}
