import '../../data/models/auth/auth_model.dart';

abstract class AuthRepository {
  Future<AuthResponseModel> login(AuthRequestModel request);
}
