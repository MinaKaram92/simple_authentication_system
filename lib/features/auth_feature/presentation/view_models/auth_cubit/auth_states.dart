import 'package:firebase_auth/firebase_auth.dart';

abstract class UserAuthStates {}

class InitialUserAuthState extends UserAuthStates {}

class UserAuthenticationSuccess extends UserAuthStates {
  final User user;

  UserAuthenticationSuccess(this.user);
}

class UserAuthenticationFailure extends UserAuthStates {
  final String error;

  UserAuthenticationFailure(this.error);
}

class UserSignoutSuccess extends UserAuthStates {}

class UserSignoutFailure extends UserAuthStates {
  final String error;

  UserSignoutFailure(this.error);
}
