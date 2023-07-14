import 'package:authentication_system_flutter/features/auth_feature/data/repos/auth_repo.dart';
import 'package:authentication_system_flutter/features/auth_feature/presentation/view_models/auth_bloc/auth_event.dart';
import 'package:authentication_system_flutter/features/auth_feature/presentation/view_models/auth_bloc/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthStates> {
  final AuthRepo _authRepo;
  AuthBloc(this._authRepo) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      if (event is AppLoaded) {
        emit(AuthLoading());
        final user = _authRepo.getCurrentUser;
        if (user != null) {
          emit(AuthAuthenticated(user: user));
        } else {
          emit(AuthNotAuthenticated());
        }
      } else if (event is UserLogedIn) {
        emit(AuthAuthenticated(user: event.user));
      } else if (event is UserLoggedOut) {
        emit(AuthNotAuthenticated());
      }
    });
  }
}
