import 'package:flutter/material.dart';

final darkprimaryColor = Color(0xFF0075DC);
final darksecondaryColor = Color(0xFF00C896);
final darkneutralColor = Color(0xFF2C2C2C);

//background color
final darkbg = Color(0xFF1C1C1C);

final darkTheme = ThemeData(
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Color(0xFFFFFFFF),
      backgroundColor: darkprimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: const Color(0xFF2C2C2C), width: 2),
    ),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: darkprimaryColor,
    brightness: Brightness.dark,
  ),
  appBarTheme: AppBarTheme(backgroundColor: darkbg),
  scaffoldBackgroundColor: darkbg,
  fontFamily: 'Inter',
);
