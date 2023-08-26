import 'package:amigo_fiel/pages/feedspot.dart';
import 'package:amigo_fiel/services/controllers/user-controller.dart';
import 'package:amigo_fiel/services/models/user.dart';
import 'package:amigo_fiel/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(title: Text('Loading User')),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: Text('Error')),
            body: Center(
              child: Text('An error occurred while loading user.'),
            ),
          );
        } else {
          return _buildMainScreen(context);
        }
      },
    );
  }

  Future<void> _initializeUser() async {
    final UserController userController = Get.put(UserController());
    await userController.getCurrentUser();
  }

  Widget _buildMainScreen(BuildContext context) {
    final UserController userController = Get.put(UserController());
    final User? user = userController.loggedUser;
    final mediaQuery = MediaQuery.of(context);
    final isDarkMode = mediaQuery.platformBrightness == Brightness.dark;
    final defaultBackgroundColor = isDarkMode ? customDefaultDarkColor : customWhiteColor;
    final defaultIconColor = isDarkMode ? customWhiteColor : customDefaultDarkColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? defaultBackgroundColor : customWhiteColor,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user?.firstName} ${user?.lastName}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            if (user?.isVerified ?? false)
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 5),
                child: Icon(
                  Icons.verified_outlined,
                  color: defaultIconColor,
                  size: 18,
                ),
              ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
        leading: IconButton(
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              '${user!.avatarUrl}', // Coloque a URL da imagem aqui
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          color: isDarkMode ? customWhiteColor : customDarkColor,
          onPressed: () {},
        ),
      ),
      body: FeedSpotInfo(
        defaultBackgroundColor: defaultBackgroundColor,
        defaultIconColor: defaultIconColor,
      ),
    );
  }
}
