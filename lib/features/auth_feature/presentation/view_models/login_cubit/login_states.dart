import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginStates {}

class InitialLoginState extends LoginStates {}

class LoadingLoginState extends LoginStates {}

class SuccessLoginState extends LoginStates {
  final User user;

  SuccessLoginState({required this.user});
}

class FailureLoginState extends LoginStates {
  final String errMessage;

  FailureLoginState(this.errMessage);
}
