import 'package:authentication_system_flutter/core/constants.dart';
import 'package:authentication_system_flutter/features/auth_feature/data/signout_commands/signout_command.dart';

class SignoutEmailAndPassword extends SignoutCommand {
  @override
  void signoutCommand() async {
    await AppConstants.auth.signOut();
  }
}
