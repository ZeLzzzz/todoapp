import 'package:go_router/go_router.dart';
import 'package:todoapp/features/auth/views/onboarding_view.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const OnboardingOneView(),
  ),
]);
