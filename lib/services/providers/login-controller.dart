import 'package:amigo_fiel/pages/home.dart';
import 'package:amigo_fiel/services/controllers/auth-controller.dart';
import 'package:amigo_fiel/services/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final authController = new AuthController();
  static LoginController get instance => Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<User?> loginWithEmail() async {
    if (emailController.text == '' || passwordController.text == '') {
      return null;
    }
    final user = await authController.loginWithEmailAndPassword(emailController.text, passwordController.text);
    Get.toNamed('/home');
    return user;
  }
}
