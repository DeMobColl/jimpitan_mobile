import 'dart:developer';

import 'package:jimpitan/core/const/prefs_key.dart';
import 'package:jimpitan/core/helpers/shared_prefs_helper.dart';
import 'package:jimpitan/domain/entities/auth/auth_request.dart';
import 'package:jimpitan/domain/entities/auth/auth_user.dart';
import 'package:jimpitan/domain/usecases/auth/login_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  FutureOr<AuthUser?> build() async {
    // Load user from storage on initialization
    final prefs = ref.read(sharedPrefsHelperProvider);
    final isLoggedIn = prefs.getBool(PrefsKey.isLoggedIn) ?? false;

    if (!isLoggedIn) {
      return null;
    }

    // If logged in, restore user data from storage
    final username = prefs.getString(PrefsKey.username);
    final token = prefs.getString(PrefsKey.authToken);
    final userId = prefs.getString(PrefsKey.userId);
    final userName = prefs.getString(PrefsKey.userName);
    final userRole = prefs.getString(PrefsKey.userRole);

    if (username != null && token != null) {
      // Return user object from stored data
      return AuthUser(
        id: userId ?? '',
        name: userName ?? username,
        role: userRole ?? '',
        username: username,
        token: token,
        tokenExpiry: prefs.getString(PrefsKey.tokenExpiry) ?? '',
        lastLogin: DateTime.now().toIso8601String(),
      );
    }

    return null;
  }

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
        // Save credentials
        prefs.setString(PrefsKey.username, username);
        prefs.setString(PrefsKey.password, password);
        prefs.setBool(PrefsKey.isLoggedIn, true);

        // Save auth token and expiry
        prefs.setString(PrefsKey.authToken, response.data!.token);
        prefs.setString(PrefsKey.tokenExpiry, response.data!.tokenExpiry);

        // Save user data
        prefs.setString(PrefsKey.userId, response.data!.id);
        prefs.setString(PrefsKey.userName, response.data!.name);
        prefs.setString(PrefsKey.userRole, response.data!.role);

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
    prefs.remove(PrefsKey.authToken);
    prefs.remove(PrefsKey.tokenExpiry);
    prefs.remove(PrefsKey.userId);
    prefs.remove(PrefsKey.userName);
    prefs.remove(PrefsKey.userRole);
    prefs.setBool(PrefsKey.isLoggedIn, false);
    log('[AuthNotifier] User logged out');
  }

  void resetState() {
    state = const AsyncValue.data(null);
  }

  void updateUser(AuthUser user) {
    // Save updated user data to storage
    final prefs = ref.read(sharedPrefsHelperProvider);
    prefs.setString(PrefsKey.userId, user.id);
    prefs.setString(PrefsKey.userName, user.name);
    prefs.setString(PrefsKey.userRole, user.role);

    state = AsyncValue.data(user);
    log('[AuthNotifier] User data updated: ${user.name}');
  }
}
