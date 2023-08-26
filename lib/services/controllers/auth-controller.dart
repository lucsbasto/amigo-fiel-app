import 'dart:async';
import 'dart:convert';
import 'package:amigo_fiel/services/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final client = http.Client();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      final response = await client
          .post(Uri.parse('http://192.168.100.7:3000/auth/login'), body: {'email': email, 'password': password});
      final responseJson = jsonDecode(response.body);
      if (responseJson['accessToken'] != null) {
        final SharedPreferences? prefs = await _prefs;
        await prefs?.setString('accessToken', responseJson['accessToken']);
        final user = User.fromJson(responseJson);
        return user;
      }
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<User?> getLoggedUser() async {
    final SharedPreferences prefs = await _prefs;
    final String? token = prefs.getString('accessToken');
    if (token == null) {
      return null;
    }
    final response = await client.get(
      Uri.http('192.168.100.7:3000', 'auth/logged', {'accessToken': '$token'}),
    );
    final responseJson = jsonDecode(response.body);
    return User.fromJson(responseJson);
  }
}
