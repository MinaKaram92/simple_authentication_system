import 'package:authentication_system_flutter/core/constants.dart';
import 'package:authentication_system_flutter/features/auth_feature/data/auth_commands/auth_command.dart';
import 'package:authentication_system_flutter/features/auth_feature/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateUserWithEmailAndPasswordCommand extends AuthCommand {
  final UserModel userModel;
  final String password;

  CreateUserWithEmailAndPasswordCommand(this.userModel, this.password);
  @override
  Future<User?> authCommand() async {
    final userCred = await AppConstants.auth.createUserWithEmailAndPassword(
        email: userModel.email, password: password);
    await AppConstants.firestrore
        .collection('users')
        .doc(userCred.user?.uid)
        .set(userModel.toJson());
    return userCred.user;
  }
}
