import 'package:flutter/material.dart';
import 'package:todoapp/core/router/app_router.dart';
import 'package:todoapp/shared/themes/dark_theme.dart';
import 'package:todoapp/shared/themes/light_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Todo App',
    );
  }
}
