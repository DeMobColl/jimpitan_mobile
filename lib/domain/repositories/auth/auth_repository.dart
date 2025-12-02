import '../../entities/auth/auth_request.dart';
import '../../entities/auth/auth_response.dart';

abstract class AuthRepository {
  Future<AuthResponse> login(AuthRequest request);
  bool isUserLoggedIn();
}
