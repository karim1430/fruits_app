import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesSingleton {
  static late SharedPreferences _instance;
  static Future<void> init() async {
    // Ensure biwndings are initialized in all contexts (idempotent)
    WidgetsFlutterBinding.ensureInitialized();
    _instance = await SharedPreferences.getInstance();
  }

  static Future<void> setBool(String key, bool value) async {
    await _instance.setBool(key, value);
  }

  static bool getBool(String key) {
    return _instance.getBool(key) ?? false;
  }

  static Future<void> setString(String key, String value) async {
    await _instance.setString(key, value);
  }

  static String? getString(String key) {
    return _instance.getString(key);
  }
}
