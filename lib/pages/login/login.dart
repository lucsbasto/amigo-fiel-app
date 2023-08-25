import 'package:amigo_fiel/pages/login/widgets/login_footer.dart';
import 'package:amigo_fiel/pages/login/widgets/login_form_widget.dart';
import 'package:amigo_fiel/utils/images.dart';
import 'package:amigo_fiel/utils/sizes.dart';
import 'package:amigo_fiel/utils/text.dart';
import 'package:amigo_fiel/widgets/features/form/form_header_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(customDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                FormHeaderWidget(
                  height: 0.17,
                  image: customWelcomeImage,
                  title: customLoginTitle,
                  subtitle: customLoginSubTitle,
                ),
                LoginFormWidget(),
                LoginFooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
