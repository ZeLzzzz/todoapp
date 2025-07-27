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
      foregroundColor: Color(0xFFFFFFFF),
      backgroundColor: darkprimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
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
