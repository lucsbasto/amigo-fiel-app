import 'package:amigo_fiel/pages/home.dart';
import 'package:amigo_fiel/pages/login/login.dart';
import 'package:amigo_fiel/services/controllers/feedspot-controller.dart';
import 'package:amigo_fiel/services/controllers/markers-controller.dart';
import 'package:amigo_fiel/services/controllers/user-controller.dart';
import 'package:amigo_fiel/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(UserController());
  Get.put(FeedspotController());
  Get.put(MarkerController());
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: CustomThemeData.lightTheme,
      darkTheme: CustomThemeData.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/signin', page: () => const LoginScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
      ],
      home: HomeScreen(),
    );
  }
}
