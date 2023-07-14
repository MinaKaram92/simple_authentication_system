import 'package:authentication_system_flutter/core/constants.dart';
import 'package:authentication_system_flutter/core/network/local/cache_helper.dart';
import 'package:authentication_system_flutter/core/simple_observer.dart';
import 'package:authentication_system_flutter/core/utils/app_router.dart';
import 'package:authentication_system_flutter/features/auth_feature/data/repos/auth_repo_impl.dart';
import 'package:authentication_system_flutter/features/auth_feature/presentation/view_models/auth_bloc/auth_bloc.dart';
import 'package:authentication_system_flutter/features/auth_feature/presentation/view_models/auth_bloc/auth_event.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  onboarding = CacheHelper.getData('onboardingDone');
  print('onboarding: $onboarding');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(AuthRepoImpl())..add(AppLoaded()),
      child: MaterialApp.router(
        routeInformationParser: AppRouter.generateRoute.routeInformationParser,
        routerDelegate: AppRouter.generateRoute.routerDelegate,
        routeInformationProvider:
            AppRouter.generateRoute.routeInformationProvider,
      ),
    );
  }
}
