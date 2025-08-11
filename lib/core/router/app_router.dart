import 'package:go_router/go_router.dart';
import 'package:todoapp/features/auth/views/login_view.dart';
import 'package:todoapp/features/auth/views/onboarding_view.dart';
import 'package:todoapp/features/auth/views/register_view.dart';
import 'package:todoapp/features/auth/views/session_end_view.dart';
import 'package:todoapp/features/auth/views/splash_view.dart';
import 'package:todoapp/features/auth/views/verify_email_view.dart';
import 'package:todoapp/features/dashboard/views/dashboard_view.dart';

final router = GoRouter(initialLocation: '/splash', routes: [
  GoRoute(path: '/splash', builder: (context, state) => const SplashView()),
  GoRoute(path: '/onboarding', builder: (context, state) => const OnboardingOneView()),
  GoRoute(path: '/onboarding-two', builder: (context, state) => const OnboardingTwoView()),
  GoRoute(path: '/session-end', builder: (context, state) => const SessionEndView()),
  GoRoute(path: '/get-started', builder: (context, state) => const GetStartedView()),
  GoRoute(path: '/login', builder: (context, state) => const LoginView()),
  GoRoute(path: '/register', builder: (context, state) => const RegisterView()),
  GoRoute(path: '/verify-email', builder: (context, state) => const VerifyEmailView()),
  GoRoute(path: '/dashboard', builder: (context, state) => const DashboardView()),
]);
