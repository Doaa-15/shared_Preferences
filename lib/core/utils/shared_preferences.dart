import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  static Future<void> saveStringData(String key, String value) async {
    final SharedPreferences prefs =
        await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<void> saveIntData(String key, int value) async {
    final SharedPreferences prefs =
        await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  static Future<String?> getStringData(String key) async {
    final SharedPreferences prefs =
        await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<int?> getIntData(String key) async {
    final SharedPreferences prefs =
        await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  static Future<void> removeData(String key) async {
    final SharedPreferences prefs =
        await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
