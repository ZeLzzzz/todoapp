import 'package:go_router/go_router.dart';
import 'package:todoapp/features/auth/views/login_view.dart';
import 'package:todoapp/features/auth/views/onboarding_view.dart';
import 'package:todoapp/features/auth/views/register_view.dart';
import 'package:todoapp/features/auth/views/verify_email_view.dart';
import 'package:todoapp/features/home/views/home_view.dart';

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
    path: '/register',
    builder: (context, state) => const RegisterView(),
  ),
  GoRoute(
    path: '/verify-email',
    builder: (context, state) => const VerifyEmailView(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => const HomeView(),
  ),
]);
