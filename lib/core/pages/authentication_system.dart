import 'package:authentication_system_flutter/core/blocs/app_manager/app_manager_bloc.dart';
import 'package:authentication_system_flutter/core/loading_screen.dart';
import 'package:authentication_system_flutter/core/utils/app_router.dart';
import 'package:authentication_system_flutter/features/auth_feature/presentation/views/login_view.dart';
import 'package:authentication_system_flutter/features/home_feature/presentation/views/home_view.dart';
import 'package:authentication_system_flutter/features/onboarding_feature/presentation/views/onboarding_view.dart';
import 'package:authentication_system_flutter/features/splash_feature/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AthenticationSystem extends StatelessWidget {
  const AthenticationSystem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AppManagerBloc, AppManagerState>(
        builder: (context, state) {
          if (state is SplashViewState) {
            return const SplashView();
          } else if (state is OnboardingViewState) {
            return const OnboardingView();
          } else if (state is UserAuthenticated) {
            return const HomeView();
          } else if (state is UserNotAuthenticated) {
            return LoginView();
          } else {
            return const LoadingScreen();
          }
        },
      ),
      onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
    );
  }
}
