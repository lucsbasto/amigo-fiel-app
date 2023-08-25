import 'package:amigo_fiel/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldTheme {
  CustomTextFormFieldTheme._();

  static InputDecorationTheme lightTheme = const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: customSecondaryColor,
    floatingLabelStyle: TextStyle(color: customSecondaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: customSecondaryColor),
    ),
  );

  static InputDecorationTheme darkTheme = const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: customPrimaryColor,
    floatingLabelStyle: TextStyle(color: customPrimaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: customPrimaryColor,
      ),
    ),
  );
}
