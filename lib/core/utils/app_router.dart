import 'package:authentication_system_flutter/core/pages/no_path.dart';
import 'package:authentication_system_flutter/features/auth_feature/presentation/views/login_view.dart';
import 'package:authentication_system_flutter/features/auth_feature/presentation/views/register_view.dart';
import 'package:authentication_system_flutter/features/home_feature/presentation/views/home_view.dart';
import 'package:authentication_system_flutter/features/onboarding_feature/presentation/views/onboarding_view.dart';
import 'package:authentication_system_flutter/features/splash_feature/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static const splashView = '/';
  static const onboardingView = '/onboardingView';
  static const loginView = '/loginView';
  static const registerView = '/registerView';
  static const homeView = '/homeView';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case onboardingView:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case loginView:
        return MaterialPageRoute(builder: (_) => LoginView());
      case registerView:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute(builder: (_) => const WrongPath());
    }
  }
}
