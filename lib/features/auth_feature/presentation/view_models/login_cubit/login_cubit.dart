import 'package:authentication_system_flutter/features/auth_feature/data/repos/auth_repo.dart';
import 'package:authentication_system_flutter/features/auth_feature/presentation/view_models/login_cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this._authRepo) : super(InitialLoginState());

  final AuthRepo _authRepo;

  // final AuthenticationMethod authenticationMethod;

  /* Future<void> loginUser() async {
    emit(LoadingLoginState());
    try {
      final user = await authenticationMethod.authenticateUser();
      emit(SuccessLoginState(user: user!));
    } catch (e) {
      emit(FailureLoginState(e.toString()));
    }
  } */

  Future<void> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(LoadingLoginState());
    try {
      final user = await _authRepo.signInWithEmailAndPassword(
          email: email, password: password);
      emit(SuccessLoginState(user: user!));
    } catch (e) {
      emit(FailureLoginState(e.toString()));
    }
  }
}
