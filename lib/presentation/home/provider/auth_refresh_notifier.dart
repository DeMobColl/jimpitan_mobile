import 'dart:developer';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/usecases/auth/silent_auth_refresh_usecase.dart';
import '../../../data/local/auth/auth_local_source.dart';
import '../../../core/helpers/shared_prefs_helper.dart';
import '../../../core/const/prefs_key.dart';
import '../../auth/provider/auth_notifier.dart';

part 'auth_refresh_notifier.g.dart';

enum AuthRefreshState { idle, refreshing, success, failed, sessionExpired }

@riverpod
class AuthRefreshNotifier extends _$AuthRefreshNotifier {
  @override
  AuthRefreshState build() => AuthRefreshState.idle;

  /// Silently refresh authentication in background
  Future<void> silentRefresh() async {
    // Check if token is expired
    final localDataSource = ref.read(authLocalDataSourceProvider);

    if (!localDataSource.isTokenExpired()) {
      // Token still valid, no need to refresh
      log('[AuthRefresh] Token still valid, skipping refresh');
      state = AuthRefreshState.success;
      return;
    }

    log('[AuthRefresh] Token expired, attempting silent refresh...');
    state = AuthRefreshState.refreshing;

    final silentAuthUseCase = ref.read(silentAuthRefreshUseCaseProvider);

    try {
      final response = await silentAuthUseCase();

      if (response != null && response.isSuccess && response.data != null) {
        // Save new token
        final prefs = ref.read(sharedPrefsHelperProvider);
        await prefs.setString(PrefsKey.authToken, response.data!.token);
        await prefs.setString(PrefsKey.tokenExpiry, response.data!.tokenExpiry);

        // Update auth state with refreshed user data
        ref.read(authNotifierProvider.notifier).updateUser(response.data!);

        state = AuthRefreshState.success;
        log('[AuthRefresh] Silent refresh successful');
      } else {
        // Refresh failed - credentials might be invalid
        state = AuthRefreshState.failed;
        log('[AuthRefresh] Silent refresh failed - invalid credentials');
      }
    } catch (e, stack) {
      state = AuthRefreshState.failed;
      log(
        '[AuthRefresh] Silent refresh error: $e',
        error: e,
        stackTrace: stack,
      );
    }
  }

  /// Mark session as expired (will trigger logout)
  void markSessionExpired() {
    state = AuthRefreshState.sessionExpired;
    log('[AuthRefresh] Session marked as expired');
  }

  /// Reset state
  void reset() {
    state = AuthRefreshState.idle;
  }
}
