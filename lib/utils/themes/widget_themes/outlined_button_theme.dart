import 'package:amigo_fiel/utils/colors.dart';
import 'package:amigo_fiel/utils/sizes.dart';
import 'package:flutter/material.dart';

class CustomOutlineButtonTheme {
  CustomOutlineButtonTheme._();

  static final lightTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: customSecondaryColor,
      backgroundColor: customWhiteColor,
      side: const BorderSide(color: customSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: customButtomHeight),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
  );

  static final darkTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: customWhiteColor,
      backgroundColor: customSecondaryColor,
      side: const BorderSide(color: customWhiteColor),
      padding: const EdgeInsets.symmetric(vertical: customButtomHeight),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
  );
}
