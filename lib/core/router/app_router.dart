import 'package:go_router/go_router.dart';
import 'package:todoapp/features/auth/views/login_view.dart';
import 'package:todoapp/features/auth/views/onboarding_view.dart';
import 'package:todoapp/features/auth/views/register_view.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const OnboardingOneView(),
  ),
  GoRoute(
    path: '/onboarding-two',
    builder: (context, state) => const OnboardingTwoView(),
  ),
  GoRoute(
    path: '/get-started',
    builder: (context, state) => const GetStartedView(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginView(),
  ),
  GoRoute(
    path: '/email-validation',
    builder: (context, state) => const EmailValidationView(),
  ),
]);
