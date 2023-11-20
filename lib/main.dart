import 'package:authentication_system_flutter/core/blocs/app_manager/app_manager_bloc.dart';
import 'package:authentication_system_flutter/core/constants.dart';
import 'package:authentication_system_flutter/core/network/local/cache_helper.dart';
import 'package:authentication_system_flutter/core/pages/authentication_system.dart';
import 'package:authentication_system_flutter/core/simple_observer.dart';
import 'package:authentication_system_flutter/features/auth_feature/data/repos/auth_repo_impl.dart';
import 'package:authentication_system_flutter/features/auth_feature/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  //CacheHelper.deleteData('onboardingDone');
  onboarding = CacheHelper.getData('onboardingDone');
  if (kDebugMode) {
    print('onboarding: $onboarding');
  }
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppManagerBloc>(
          create: (context) =>
              AppManagerBloc(AuthRepoImpl())..add(SplashViewEvent()),
        ),
        BlocProvider<UserAuthCubit>(
          create: (context) => UserAuthCubit(AuthRepoImpl()),
        ),
      ],
      child: const AthenticationSystem(),
    ),
  );
}
