import 'dart:developer';

import 'package:jimpitan/data/models/auth/auth_model.dart';
import 'package:jimpitan/domain/usecases/login_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<AuthUserModel?> build() => null;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    final useCase = ref.read(loginUseCaseProvider);

    try {
      final request = AuthRequestModel(username: username, password: password);
      final response = await useCase(request);

      if (response.isSuccess && response.data != null) {
        state = AsyncValue.data(response.data);
        log(
          '[AuthController] Login successful for user: ${response.data!.name}',
        );
      } else {
        final errorMessage = response.message ?? 'Login failed';
        log('[AuthController] Login failed: $errorMessage');
        throw Exception(errorMessage);
      }
    } catch (e, stack) {
      state = AsyncValue.error(
        e.toString().replaceAll('Exception: ', ''),
        stack,
      );
      log('[AuthController] Login error: $e', error: e, stackTrace: stack);
    }
  }

  void logout() {
    state = const AsyncValue.data(null);
    log('[AuthController] User logged out');
  }

  void resetState() {
    state = const AsyncValue.data(null);
  }
}
