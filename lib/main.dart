import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:todoapp/app.dart';
import 'package:todoapp/core/di/service_locator.dart';

void main() async {
  setupLocator();
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}
