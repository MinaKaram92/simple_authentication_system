import 'package:authentication_system_flutter/features/auth_feature/data/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'app_manager_event.dart';
part 'app_manager_state.dart';

class AppManagerBloc extends Bloc<AppManagerEvent, AppManagerState> {
  final AuthRepo _authRepo;
  AppManagerBloc(this._authRepo) : super(AppManagerInitialState()) {
    on<AppManagerEvent>((event, emit) {
      if (event is SplashViewEvent) {
        emit(SplashViewState());
      } else if (event is OnboardingViewEvent) {
        emit(OnboardingViewState());
      } else if (event is UserAuthStartedEvent) {
        emit(UserAuthLoading());
        final user = _authRepo.getCurrentUser;
        if (user != null) {
          emit(UserAuthenticated(user: user));
        } else {
          emit(UserNotAuthenticated());
        }
      }
    });
  }
}
