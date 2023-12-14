import 'package:flutter/material.dart';

class AppTheme {
  static const fontFamily = "Barlow";
  static const primaryColor = Color(0xFF0065FF);
  static const secColor = Color(0xFFE1ECFE);
  static const bgColor = Color(0xFFEDF1FC);
  static const bodyColor = Color(0xFF172B4D);
  static const capColor = Color(0xFF626F87);

  static const mobilePadding = 16.0;
  static const tabletPadding = 32.0;

  static final lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: fontFamily,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: bgColor,
    colorScheme: ThemeData().colorScheme.copyWith(primary: primaryColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        textStyle: const TextStyle(
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.w500,
        ),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: AppTheme.primaryColor.withOpacity(.1),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),
  );
}
