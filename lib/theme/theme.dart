import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF0065FF);
  static const secColor = Color(0xFFE1ECFE);
  static const bgColor = Color(0xFFEDF1FC);
  static const bodyColor = Color(0xFF162862);
  static const capColor = Color(0xFFC8CBD8);

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: bgColor,
    colorScheme: ThemeData().colorScheme.copyWith(primary: primaryColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        textStyle: const TextStyle(color: Color(0xFFFFFFFF)),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
  );
}
