import 'package:authentication_system_flutter/features/auth_feature/data/auth_commands/auth_command.dart';
import 'package:authentication_system_flutter/features/auth_feature/data/models/user_model.dart';
import 'package:authentication_system_flutter/features/auth_feature/data/repos/auth_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  @override
  User? get getCurrentUser => _auth.currentUser;

  @override
  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final userCred = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCred.user;
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }

  @override
  Future<User?> registerUserWithEmailAndPassword(
      {required UserModel userModel, required String password}) async {
    final userCred = await _auth.createUserWithEmailAndPassword(
        email: userModel.email, password: password);
    await _fireStore
        .collection('users')
        .doc(userCred.user?.uid)
        .set(userModel.toJson());

    return userCred.user;
  }

  @override
  Future<User?> executeAuthCommand(AuthCommand authCommand) {
    return authCommand.authCommand();
  }
}
