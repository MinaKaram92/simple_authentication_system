import 'package:authentication_system_flutter/features/auth_feature/presentation/views/login_view.dart';
import 'package:authentication_system_flutter/features/auth_feature/presentation/views/register_view.dart';
import 'package:authentication_system_flutter/features/home_feature/presentation/views/home_view.dart';
import 'package:authentication_system_flutter/features/onboarding_feature/presentation/views/onboarding_view.dart';
import 'package:authentication_system_flutter/features/splash_feature/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const splashView = '/';
  static const onboardingView = '/onboardingView';
  static const loginView = '/loginView';
  static const registerView = '/registerView';
  static const homeView = '/homeView';

  static final generateRoute = GoRouter(
    routes: [
      GoRoute(
        path: splashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: onboardingView,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: loginView,
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: registerView,
        builder: (context, state) => RegisterView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
