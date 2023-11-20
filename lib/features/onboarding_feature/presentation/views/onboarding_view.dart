import 'package:authentication_system_flutter/core/network/local/cache_helper.dart';
import 'package:authentication_system_flutter/core/utils/app_router.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'onboarding view',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRouter.loginView);
          CacheHelper.saveData('onboardingDone', true);
        },
        child: const Icon(
          Icons.forward,
        ),
      ),
    );
  }
}
