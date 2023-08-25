// ignore_for_file: deprecated_member_use

import 'package:amigo_fiel/utils/themes/widget_themes/evelated_button_theme.dart';
import 'package:amigo_fiel/utils/themes/widget_themes/outlined_button_theme.dart';
import 'package:amigo_fiel/utils/themes/widget_themes/text_field_theme.dart';
import 'package:amigo_fiel/utils/themes/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class CustomThemeData {
  CustomThemeData._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: CustomTextTheme.lightTextTheme,
    outlinedButtonTheme: CustomOutlineButtonTheme.lightTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightTheme,
    inputDecorationTheme: CustomTextFormFieldTheme.lightTheme,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black, // Change the color here
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: CustomTextTheme.darkTextTheme,
    outlinedButtonTheme: CustomOutlineButtonTheme.darkTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkTheme,
    inputDecorationTheme: CustomTextFormFieldTheme.darkTheme,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white, // Change the color here
      ),
    ),
  );
}
