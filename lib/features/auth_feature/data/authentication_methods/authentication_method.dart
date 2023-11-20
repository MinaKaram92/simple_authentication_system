import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationMethod {
  final auth = FirebaseAuth.instance;

  Future<User?> authenticateUser();

  Future<void> signOut();

  User? get getCurrentUser => auth.currentUser;

  Stream<User?> authStateChanges() {
    return auth.authStateChanges();
  }
}
