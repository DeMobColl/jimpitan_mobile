import 'dart:developer';

import 'package:jimpitan/core/const/prefs_key.dart';
import 'package:jimpitan/core/helpers/shared_prefs_helper.dart';
import 'package:jimpitan/domain/entities/auth/auth_request.dart';
import 'package:jimpitan/domain/entities/auth/auth_user.dart';
import 'package:jimpitan/domain/usecases/login_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  FutureOr<AuthUser?> build() => null;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    final useCase = ref.read(loginUseCaseProvider);

    try {
      final request = AuthRequest(username: username, password: password);
      final response = await useCase(request);
      final prefs = ref.read(sharedPrefsHelperProvider);

      if (response.isSuccess && response.data != null) {
        prefs.setString(PrefsKey.username, username);
        prefs.setString(PrefsKey.password, password);

        state = AsyncValue.data(response.data);
        log('[AuthNotifier] Login successful for user: ${response.data!.name}');
      } else {
        final errorMessage = response.message ?? 'Login failed';
        log('[AuthNotifier] Login failed: $errorMessage');
        throw Exception(errorMessage);
      }
    } catch (e, stack) {
      state = AsyncValue.error(
        e.toString().replaceAll('Exception: ', ''),
        stack,
      );
      log('[AuthNotifier] Login error: $e', error: e, stackTrace: stack);
    }
  }

  void logout() {
    final prefs = ref.read(sharedPrefsHelperProvider);
    state = const AsyncValue.data(null);
    prefs.remove(PrefsKey.username);
    prefs.remove(PrefsKey.password);
    log('[AuthNotifier] User logged out');
  }

  void resetState() {
    state = const AsyncValue.data(null);
  }
}
