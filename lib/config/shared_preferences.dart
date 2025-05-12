import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesFunctions {
  // check if user has seen onboarding in first time
  static Future<void> setOnBoardingSeen() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('has_seen_onboarding', true);
}

static Future<bool> hasSeenOnBoarding() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('has_seen_onboarding') ?? false;
}
  static Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  static Future<void> clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }
}
