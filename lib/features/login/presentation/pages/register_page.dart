import 'package:amigo_fiel/features/login/components/my_button.dart';
import 'package:amigo_fiel/features/login/components/square_tile.dart';
import 'package:amigo_fiel/features/login/presentation/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  void goToLoginPage(){
   Navigator.of(context)
   .push(
    MaterialPageRoute(
      builder: (context) => LoginPage()
    ));
  }

  void signUserUp() async {
    try{
      showDialog(context: context, builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text
      );
      print("<--------------LOGOU-------------");
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      print(e.code+"<---------------------------");
      invalidEmailOrPassword();
    }
  }

  invalidEmailOrPassword() {
    showDialog(context: context, builder: (context){
      return const AlertDialog(
        title: Text("Email ou senha invalidos!"),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,        
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          backgroundColor: Colors.grey[300],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
               const SizedBox(height: 8),
                // email text field
                MyTextField(
                  controller: emailController,
                  obscureText: false,
                  labelText: "Digite seu email",
                ),
                const SizedBox(height: 8),
                MyTextField(
                  controller: passwordController,
                  obscureText: true,
                  labelText: "Digite sua senha",
                ),
               const SizedBox(height: 8),
                MyTextField(
                  controller: passwordConfirmationController,
                  obscureText: true,
                  labelText: "Confirme sua senha",
                ),
                const SizedBox(height: 40),
                MyButton(onPressed: signUserUp, text: "Registrar"),
                const SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(
                        color: Colors.white,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Ou continue com",
                          style: TextStyle(color: Colors.grey[700]),
                        )
                      ),
                      const Expanded(
                          child: Divider(
                        color: Colors.white,
                      )),
                    ],
                  ),
                ),
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SquareTile(imagePath: 'lib/assets/images/google.png'),
                    SizedBox(width: 16),
                    SquareTile(imagePath: 'lib/assets/images/apple.png'),                  ],
                ),
                const SizedBox(height: 12),
                     GestureDetector(
                  onTap: goToLoginPage,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Já é registrado ?"),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: null,
                        child: const Text(
                          "Fazer login",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}