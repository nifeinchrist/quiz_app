import 'package:flutter/material.dart';

class AppTheme {
  // New Color Palette
  static const Color darkOrange = Color(0xFFD95F02);      // Headings / Navigation
  static const Color primaryOrange = Color(0xFFFF8C00);   // Main buttons / Key actions
  static const Color mediumOrange = Color(0xFFFFA94D);    // Cards / Illustrations
  static const Color lightOrange = Color(0xFFFFD8A8);     // Backgrounds / Highlights
  static const Color veryLightOrange = Color(0xFFFFF3E0); // Main page background
  static const Color lemonGreen = Color(0xFFA8D129);      // Accents / Progress bars / Positive actions
  static const Color lightLemonGreen = Color(0xFFD9F2A3); // Subtle highlights / Secondary backgrounds
  static const Color veryLightGreen = Color(0xFFF1F8D8);  // Soft green background accents

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryOrange,
      scaffoldBackgroundColor: veryLightOrange,
      appBarTheme: const AppBarTheme(
        backgroundColor: darkOrange,
        foregroundColor: Colors.white,
      ),
      colorScheme: const ColorScheme.light(
        primary: primaryOrange,
        secondary: lemonGreen,
        surface: veryLightOrange,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryOrange,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
