import 'package:authentication_system_flutter/features/auth_feature/data/auth_commands/auth_command.dart';
import 'package:authentication_system_flutter/features/auth_feature/data/repos/auth_repo.dart';
import 'package:authentication_system_flutter/features/auth_feature/data/signout_commands/signout_command.dart';
import 'package:authentication_system_flutter/features/auth_feature/presentation/view_models/auth_cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAuthCubit extends Cubit<UserAuthStates> {
  UserAuthCubit(this._authRepo) : super(InitialUserAuthState());

  final AuthRepo _authRepo;

  void authenticateUser(AuthCommand authCommand) async {
    _authRepo.executeAuthCommand(authCommand).then((user) {
      if (user != null) {
        emit(UserAuthenticationSuccess(user));
      }
    }).catchError((e) {
      emit(UserAuthenticationFailure(e.toString()));
    });
  }

  void signOut(SignoutCommand signoutCommand) {
    try {
      signoutCommand.signoutCommand();
      emit(UserSignoutSuccess());
    } catch (e) {
      emit(UserSignoutFailure(e.toString()));
    }
  }
}
