import 'package:firebase_auth/firebase_auth.dart';
import 'package:equatable/equatable.dart';

abstract class AuthStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthStates {}

class AuthLoading extends AuthStates {}

class AuthNotAuthenticated extends AuthStates {}

class AuthAuthenticated extends AuthStates {
  final User user;

  AuthAuthenticated({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthFailure extends AuthStates {
  final String errMessage;

  AuthFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
