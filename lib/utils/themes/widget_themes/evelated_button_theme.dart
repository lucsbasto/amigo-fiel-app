import 'package:amigo_fiel/utils/colors.dart';
import 'package:amigo_fiel/utils/sizes.dart';
import 'package:flutter/material.dart';

class CustomElevatedButtonTheme {
  CustomElevatedButtonTheme._();

  static final lightTheme = ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: customWhiteColor,
      backgroundColor: customSecondaryColor,
      side: const BorderSide(color: customSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: customButtomHeight),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
  );

  static final darkTheme = ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: customSecondaryColor,
      backgroundColor: customWhiteColor,
      side: const BorderSide(color: customWhiteColor),
      padding: const EdgeInsets.symmetric(vertical: customButtomHeight),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
  );
}
