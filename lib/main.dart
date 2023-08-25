import 'package:amigo_fiel/pages/home.dart';
import 'package:amigo_fiel/pages/login/login.dart';
import 'package:amigo_fiel/utils/themes/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomThemeData.lightTheme,
      darkTheme: CustomThemeData.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
