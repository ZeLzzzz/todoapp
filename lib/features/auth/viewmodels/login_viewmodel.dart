import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/core/di/service_locator.dart';
import 'package:todoapp/core/utils/shared_prefs_util.dart';
import 'package:todoapp/data/models/login_response.dart';
import 'package:todoapp/data/repositories/auth_repository.dart';
import 'package:todoapp/shared/widgets/toast_widget.dart';

class LoginViewmodel with ChangeNotifier {
  final AuthRepository _authRepository = sl<AuthRepository>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  Future<void> login(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      final LoginResponse response =
          await _authRepository.login(emailController.text, passwordController.text);

      ToastWidget.showToast(
        context,
        message: 'Login successful!',
        backgroundColor: const Color(0xFF2ECC71),
      );

      final token = await SharedPrefsUtil.getSession('token');
      print('Token: $token');

      context.go('/home');
    } on DioException catch (e) {
      String errorMessage = 'Login failed. Please try again.';

      if (e.response != null && e.response?.data is Map<String, dynamic>) {
        final data = e.response!.data;
        if (data.containsKey('message')) {
          errorMessage = data['message'];
        }
      }

      ToastWidget.showToast(
        context,
        message: errorMessage,
        backgroundColor: const Color(0xFFE74C3C),
      );
    } catch (e) {
      ToastWidget.showToast(
        context,
        message: 'Unexpected error. Please try again.',
        backgroundColor: const Color(0xFFE74C3C),
      );
    } finally {
      emailController.clear();
      passwordController.clear();
    }
  }
}
