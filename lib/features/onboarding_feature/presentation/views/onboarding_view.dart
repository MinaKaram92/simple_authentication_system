import 'package:authentication_system_flutter/core/network/local/cache_helper.dart';
import 'package:authentication_system_flutter/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'onboarding view',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).go(AppRouter.loginView);
          CacheHelper.saveData('onboardingDone', true);
        },
        child: const Icon(
          Icons.forward,
        ),
      ),
    );
  }
}
