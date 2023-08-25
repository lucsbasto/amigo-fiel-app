import 'dart:async';
import 'dart:convert';
import 'package:amigo_fiel/services/models/user.dart';
import 'package:http/http.dart' as http;

class AuthController {
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    final client = http.Client();
    try {
      var response = await client.post(Uri.parse('http://192.168.100.7:3000/auth/login'), body: {email, password});
      final responseJson = jsonDecode(response.body);
      return User.fromJson(responseJson);
    } catch (error) {
      print(error);
    }
    return null;
  }
}
