import 'package:amigo_fiel/pages/feedspot.dart';
import 'package:amigo_fiel/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              'user.fullName!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
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
              '',
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
