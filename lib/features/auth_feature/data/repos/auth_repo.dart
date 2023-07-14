import 'package:authentication_system_flutter/features/auth_feature/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  User? get getCurrentUser;

  Stream<User?> authStateChanges();

  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<User?> registerUserWithEmailAndPassword(
      {required UserModel userModel, required String password});

  Future<void> signOut();
}
