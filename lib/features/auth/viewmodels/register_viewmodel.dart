import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/core/di/service_locator.dart';
import 'package:todoapp/core/network/dio_client.dart';
import 'package:todoapp/data/repositories/auth_repository.dart';
import 'package:todoapp/shared/widgets/toast_widget.dart';
import 'package:go_router/go_router.dart';

class RegisterViewmodel extends ChangeNotifier {
  final AuthRepository _authRepository = sl<AuthRepository>();

  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    } else if (value.length < 5) {
      return 'Username must be at least 5 characters';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!_isValidEmail(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    } else if (!value.contains(RegExp(r'[a-zA-Z]'))) {
      return 'Password must contain at least one letter';
    }
    return null;
  }

  void register(BuildContext context) async {
    try {
      await _authRepository.register(
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text);

      ToastWidget.showToast(context,
          message: 'Registration successful! Please verify your email.',
          backgroundColor: Color(0xFF2ECC71));

      context.go('/verify-email');
    } on DioException catch (e) {
      print('Dio error: ${e.message}');
      print('Response: ${e.response?.data}');
    } catch (e) {
      print('Other error: $e');
    } finally {
      usernameController.clear();
      emailController.clear();
      passwordController.clear();
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
