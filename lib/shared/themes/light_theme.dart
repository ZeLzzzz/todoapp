import 'package:flutter/material.dart';

final lightprimaryColor = Color(0xFF0075DC);
final lightsecondaryColor = Color(0xFF00C896);
final lightneutralColor = Color(0xFFF5F5F5);

//background color
final lighbg = Color(0xFFFFFFFF);

final lightTheme = ThemeData(
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Color(0xFFFFFFFF),
      backgroundColor: lightprimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: lightprimaryColor,
    brightness: Brightness.light,
  ),
  appBarTheme: AppBarTheme(backgroundColor: lighbg),
  scaffoldBackgroundColor: lighbg,
  fontFamily: 'Inter',
);
