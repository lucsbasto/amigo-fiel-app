import 'package:amigo_fiel/services/providers/login-controller.dart';
import 'package:amigo_fiel/utils/colors.dart';
import 'package:amigo_fiel/utils/sizes.dart';
import 'package:amigo_fiel/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final controller = Get.put(LoginController());
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: customFormHeight - 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.emailController,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: customSecondaryColor)),
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: customEmailLabelText,
                  hintText: customEmailHintText,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
              ),
              const SizedBox(
                height: customFormHeight - 20,
              ),
              TextFormField(
                controller: controller.passwordController,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: customSecondaryColor)),
                  prefixIcon: Icon(Icons.fingerprint),
                  labelText: customPasswordLabelText,
                  hintText: customPasswordHintText,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.remove_red_eye_sharp),
                  ),
                ),
              ),
              const SizedBox(
                height: customFormHeight - 30,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(customForgetPasswordText),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.loginWithEmail();
                  },
                  child: Text(customLoginText.toUpperCase()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
