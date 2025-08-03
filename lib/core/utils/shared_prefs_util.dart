import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtil {
  static Future<void> saveSession(String title, String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(title, data);
  }

  static Future<String?> getSession(String title) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(title);
  }

  static Future<void> clearSession(String title) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(title);
  }

  static Future<bool> hasSession(String title) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(title);
  }
}
