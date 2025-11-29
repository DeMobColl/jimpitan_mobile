import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/helpers/shared_prefs_helper.dart';
import '../../../core/const/prefs_key.dart';

class AuthLocalDataSource {
  final SharedPrefsHelper prefsHelper;

  AuthLocalDataSource({required this.prefsHelper});

  /// Check if user is logged in
  bool isUserLoggedIn() {
    return prefsHelper.getBool(PrefsKey.isLoggedIn) ?? false;
  }

  /// Get stored username
  String? getStoredUsername() {
    return prefsHelper.getString(PrefsKey.username);
  }

  /// Get stored password
  String? getStoredPassword() {
    return prefsHelper.getString(PrefsKey.password);
  }

  /// Get stored auth token
  String? getStoredToken() {
    return prefsHelper.getString(PrefsKey.authToken);
  }

  /// Get token expiry timestamp
  String? getTokenExpiry() {
    return prefsHelper.getString(PrefsKey.tokenExpiry);
  }

  /// Check if token is expired
  bool isTokenExpired() {
    final expiryStr = prefsHelper.getString(PrefsKey.tokenExpiry);
    if (expiryStr == null) return true;

    try {
      final expiry = DateTime.parse(expiryStr);
      return DateTime.now().isAfter(expiry);
    } catch (e) {
      return true;
    }
  }

  /// Save auth token
  Future<void> saveAuthToken(String token, String expiry) async {
    await prefsHelper.setString(PrefsKey.authToken, token);
    await prefsHelper.setString(PrefsKey.tokenExpiry, expiry);
  }

  /// Clear authentication data
  Future<void> clearAuthData() async {
    await prefsHelper.remove(PrefsKey.username);
    await prefsHelper.remove(PrefsKey.password);
    await prefsHelper.remove(PrefsKey.authToken);
    await prefsHelper.remove(PrefsKey.tokenExpiry);
    await prefsHelper.setBool(PrefsKey.isLoggedIn, false);
  }
}

// Provider
final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  final prefsHelper = ref.watch(sharedPrefsHelperProvider);
  return AuthLocalDataSource(prefsHelper: prefsHelper);
});
