import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppConstants {
  static final auth = FirebaseAuth.instance;
  static final firestrore = FirebaseFirestore.instance;
}

bool? onboarding;
