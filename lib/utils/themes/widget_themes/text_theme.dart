import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amigo_fiel/utils/colors.dart';

class CustomTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
      fontSize: 28.0,
      color: customDarkColor,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: GoogleFonts.montserrat(
      fontSize: 24.0,
      color: customDarkColor,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 20.0,
      color: customDarkColor,
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: GoogleFonts.poppins(
      fontSize: 18.0,
      color: customDarkColor,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 16.0,
      color: customDarkColor,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 13.0,
      color: customDarkColor,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 14,
      color: customDarkColor,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 14,
      color: customDarkColor,
      fontWeight: FontWeight.w500,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
      fontSize: 28.0,
      color: customWhiteColor,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: GoogleFonts.montserrat(
      fontSize: 24.0,
      color: customWhiteColor,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 20.0,
      color: customWhiteColor,
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: GoogleFonts.poppins(
      fontSize: 18.0,
      color: customWhiteColor,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 16.0,
      color: customWhiteColor,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 14.0,
      color: customWhiteColor,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 14,
      color: customWhiteColor,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 14,
      color: customWhiteColor,
      fontWeight: FontWeight.w500,
    ),
  );
}
