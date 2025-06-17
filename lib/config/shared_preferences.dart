import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesFunctions {
  // onBoarding methods
  static Future<void> setOnBoardingSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('has_seen_onboarding', true);
  }

  static Future<bool> hasSeenOnBoarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('has_seen_onboarding') ?? false;
  }


  // Theme methods
  static Future<void> setThemeMode(String themeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme_mode', themeMode);
  }

  static Future<String> getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('theme_mode') ?? 'light';
  }

  static Future<void> clearThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('theme_mode');
  }
}
