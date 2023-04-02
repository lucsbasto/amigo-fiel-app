import 'package:amigo_fiel/features/components/square_tile.dart';
import 'package:flutter/material.dart';
import 'package:amigo_fiel/features/components/my_textfield.dart';
import 'package:amigo_fiel/features/components/my_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({ Key? key }) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(leading: const BackButton(color: Colors.black), backgroundColor: Colors.grey[300]),
      body: SafeArea(
       child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Image.asset(
              'lib/assets/images/avatar.png',
              width: 80,
              height: 80,
              ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Bem vindo de volta, Amigo Fiel!', 
              style: TextStyle(color: Colors.grey[700], fontSize: 16,
              fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          // email text field
          MyTextField(controller: usernameController, hintText: "email@mail.com", obscureText: false, labelText: "Digite seu email",),
          const SizedBox(height: 8),
          // password text field
          MyTextField(controller: passwordController, hintText: "password",obscureText: true, labelText: "Digite sua senha"),
          const SizedBox(height: 16),

          // Forgot password 
          Text('Esqueceu sua senha ?', style: TextStyle(color: Colors.grey[700])),
          const SizedBox(height: 16),

          // Login button
          const MyButton(onPressed: null),
          const SizedBox(height: 16),
           //divider 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                const Expanded(child: Divider(
                  color: Colors.white,
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Ou continue com", style: TextStyle(color: Colors.grey[700]),),
                ),
                const Expanded(child: Divider(
                  color: Colors.white,
                  )
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Login com google
          // Login com apple
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
              SquareTile(imagePath: 'lib/assets/images/google.png'),
              SizedBox(width: 16),
              SquareTile(imagePath: 'lib/assets/images/apple.png'),
            ],
          ),
          const SizedBox(height: 12),

          // náo registrado ? register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Náo é registrado ?"),
              SizedBox(width: 4,),
              Text("Registre-se ?",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)
            ],
          )
        ],
      ),
      ) 
    );
  }
}