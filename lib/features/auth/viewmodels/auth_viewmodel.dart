import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import 'package:todoapp/core/di/service_locator.dart';
import 'package:todoapp/data/repositories/auth_repository.dart';
import 'package:todoapp/shared/widgets/toast_widget.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = sl<AuthRepository>();

  bool _isLoggedIn = false;
  bool _isLoading = false;

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;

  final formKey = GlobalKey<FormState>();

  Future<void> checkLoginStatus() async {
    _isLoggedIn = await _authRepository.isUserHavingSession();
    notifyListeners();
  }

  Future<bool> validateToken() async {
    return await _authRepository.isTheUserTokenValid();
  }

  Future<void> login(BuildContext context, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authRepository.login(email, password);

      ToastWidget.showToast(
        context,
        message: 'Login successful!',
        backgroundColor: const Color(0xFF2ECC71),
      );

      _isLoggedIn = true;
      context.go('/dashboard');
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
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> register(
      BuildContext context, String username, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authRepository.register(
        username: username,
        email: email,
        password: password,
      );

      ToastWidget.showToast(
        context,
        message: 'Registration successful! Please verify your email.',
        backgroundColor: const Color(0xFF2ECC71),
      );

      context.go('/verify-email');
    } on DioException catch (e) {
      String errorMessage = 'Registration failed. Please try again.';

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
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await _authRepository.logout();

      _isLoggedIn = false;
      ToastWidget.showToast(
        context,
        message: 'Logout successful!',
        backgroundColor: const Color(0xFF2ECC71),
      );

      context.go('/onboarding');
    } catch (e) {
      ToastWidget.showToast(
        context,
        message: 'Logout failed. Please try again.',
        backgroundColor: const Color(0xFFE74C3C),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
