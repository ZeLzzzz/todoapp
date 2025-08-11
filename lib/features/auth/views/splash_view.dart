import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/features/auth/viewmodels/auth_viewmodel.dart';
import 'package:todoapp/core/di/service_locator.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = sl<AuthViewModel>();

    Future.microtask(() async {
      await authViewModel.checkLoginStatus();
      final isTokenValid = await authViewModel.validateToken();

      if (!authViewModel.isLoggedIn) {
        context.go('/onboarding');
      } else if (!isTokenValid) {
        context.go('/session-end');
      } else {
        context.go('/dashboard');
      }
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/illustrations/logos.png',
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
