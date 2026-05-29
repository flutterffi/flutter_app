import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  const AppStorage(this._preferences);

  final SharedPreferences _preferences;

  Future<bool> writeString(String key, String value) {
    return _preferences.setString(key, value);
  }

  String? readString(String key) {
    return _preferences.getString(key);
  }

  Future<bool> remove(String key) {
    return _preferences.remove(key);
  }
}
