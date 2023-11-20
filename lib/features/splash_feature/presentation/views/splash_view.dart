import 'package:authentication_system_flutter/core/blocs/app_manager/app_manager_bloc.dart';
import 'package:authentication_system_flutter/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void _delay() {
    Future.delayed(const Duration(seconds: 5), () {
      _goNext();
    });
  }

  void _goNext() {
    if (onboarding == null) {
      BlocProvider.of<AppManagerBloc>(context).add(OnboardingViewEvent());
    } else {
      BlocProvider.of<AppManagerBloc>(context).add(UserAuthStartedEvent());
    }
  }

  @override
  void initState() {
    super.initState();
    _delay();
  }

  @override
  Widget build(BuildContext context) {
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
  }
}
