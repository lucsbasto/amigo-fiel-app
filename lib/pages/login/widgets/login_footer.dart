import 'package:amigo_fiel/utils/images.dart';
import 'package:amigo_fiel/utils/sizes.dart';
import 'package:amigo_fiel/utils/text.dart';
import 'package:flutter/material.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("OR"),
        const SizedBox(
          height: customFormHeight - 15,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(
              image: AssetImage(customGoogleLogo),
              width: 20,
            ),
            onPressed: () => {},
            label: Text(customSignInWithGoogle.toUpperCase()),
          ),
        ),
        const SizedBox(
          height: customFormHeight - 15,
        ),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
              text: customDontHaveAnAccount,
              style: Theme.of(context).textTheme.bodyLarge,
              children: const [
                TextSpan(
                  text: customSignUpText,
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
