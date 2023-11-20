import 'package:authentication_system_flutter/features/auth_feature/data/authentication_methods/authentication_method.dart';
import 'package:authentication_system_flutter/features/auth_feature/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class EmailAndPasswordAuthentication extends AuthenticationMethod {
  final String email;
  final String password;
  final _fireStore = FirebaseFirestore.instance;

  EmailAndPasswordAuthentication({required this.email, required this.password});

  /* @override
  Future<User?> authenticateUser() async {
    final userCred =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return userCred.user;
  }

  Future<User?> registerUserWithEmailAndPassword(
      {required UserModel userModel, required String password}) async {
    final userCred = await auth.createUserWithEmailAndPassword(
        email: userModel.email, password: password);
    await _fireStore
        .collection('users')
        .doc(userCred.user?.uid)
        .set(userModel.toJson());
    return userCred.user;
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  } */
}
