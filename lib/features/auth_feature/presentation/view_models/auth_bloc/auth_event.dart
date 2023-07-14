import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppLoaded extends AuthEvent {}

class UserLogedIn extends AuthEvent {
  final User user;

  UserLogedIn({required this.user});

  @override
  List<Object?> get props => [user];
}

class UserLoggedOut extends AuthEvent {}
