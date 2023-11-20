import 'package:authentication_system_flutter/core/constants.dart';
import 'package:authentication_system_flutter/features/auth_feature/data/auth_commands/auth_command.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginWithEmailAndPasswordCommand extends AuthCommand {
  final String email;
  final String password;

  LoginWithEmailAndPasswordCommand(
      {required this.email, required this.password});
  @override
  Future<User?> authCommand() async {
    final userCred = await AppConstants.auth
        .signInWithEmailAndPassword(email: email, password: password);
    return userCred.user;
  }
}
