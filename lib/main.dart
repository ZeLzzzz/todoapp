import 'package:flutter/material.dart';
import 'package:todoapp/app.dart';
import 'package:todoapp/core/di/service_locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}
