import 'package:authentication_system_flutter/features/auth_feature/data/signout_commands/signout_command.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignoutGoogle extends SignoutCommand {
  @override
  void signoutCommand() async {
    await GoogleSignIn().signOut();
  }
}
