import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jimpitan/core/providers/shared_prefrences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  final SharedPreferences prefs;

  SharedPrefsHelper({required this.prefs});

   Future<void> setString(String key, String value) async =>
      await prefs.setString(key, value);

  Future<void> setBool(String key, bool value) async =>
      await prefs.setBool(key, value);

  Future<void> setInt(String key, int value) async =>
      await prefs.setInt(key, value);

  Future<void> setDouble(String key, double value) async =>
      await prefs.setDouble(key, value);

  String? getString(String key) => prefs.getString(key);

  bool? getBool(String key) => prefs.getBool(key);

  int? getInt(String key) => prefs.getInt(key);

  double? getDouble(String key) => prefs.getDouble(key);

  Future<void> remove(String key) async => prefs.remove(key);

  Future<void> clearAll() async => await prefs.clear();

}

final sharedPrefsHelperProvider = Provider<SharedPrefsHelper>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return SharedPrefsHelper(prefs: sharedPreferences);
});
