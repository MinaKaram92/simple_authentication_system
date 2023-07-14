import 'package:authentication_system_flutter/core/constants.dart';
import 'package:authentication_system_flutter/core/utils/app_router.dart';
import 'package:authentication_system_flutter/features/auth_feature/presentation/view_models/auth_bloc/auth_bloc.dart';
import 'package:authentication_system_flutter/features/auth_feature/presentation/view_models/auth_bloc/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      if (onboarding == null) {
        GoRouter.of(context).go(AppRouter.onboardingView);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          GoRouter.of(context).go(AppRouter.homeView);
        } else if (state is AuthNotAuthenticated) {
          GoRouter.of(context).go(AppRouter.loginView);
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Splash View',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
