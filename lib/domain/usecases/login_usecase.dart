import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/auth/auth_model.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  Future<AuthResponseModel> call(AuthRequestModel request) {
    return repository.login(request);
  }
}

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(repository: ref.watch(authRepositoryProvider));
});
