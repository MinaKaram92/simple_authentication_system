import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthCommand {
  Future<User?> authCommand();
}
