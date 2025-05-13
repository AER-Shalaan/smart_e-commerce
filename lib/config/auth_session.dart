import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthSession {
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  static Future<String?> getUserId() async {
    final token = await getToken();
    if (token == null || token.isEmpty) return null;
    final decoded = JwtDecoder.decode(token);
    return decoded['nameid']?.toString();
  }

  static Future<void> saveSession(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
    final decoded = JwtDecoder.decode(token);
    final userId = decoded['nameid']?.toString();
    if (userId != null) {
      await prefs.setString('user_id', userId);
    }
  }

  static Future<({String token, String userId})?> getSession() async {
    final token = await getToken();
    if (token == null || token.isEmpty || JwtDecoder.isExpired(token))
      return null;
    final decoded = JwtDecoder.decode(token);
    final userId = decoded['nameid']?.toString();
    if (userId == null) return null;
    return (token: token, userId: userId);
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('user_id');
  }

  static Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty && !JwtDecoder.isExpired(token);
  }
}
