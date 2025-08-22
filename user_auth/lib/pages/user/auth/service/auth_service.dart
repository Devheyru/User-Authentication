import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      if (email.isEmpty || name.isEmpty || password.isEmpty) {
        return "Please fill all fields";
      }

      // Create user in Firebase Authentication
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store user data in Firestore
      await _firestore.collection("users").doc(cred.user!.uid).set({
        "name": name,
        "email": email,
        "uid": cred.user!.uid,
        "createdAt": FieldValue.serverTimestamp(),
      });

      return "Success";
    } catch (e) {
      return e.toString();
    }
  }

  // Login user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        return "Please fill all fields";
      }

      await _auth.signInWithEmailAndPassword(email: email, password: password);

      return "Success";
    } catch (e) {
      return e.toString();
    }
  }

  // Log out
  Future<String> signOut() async {
    await _auth.signOut();
    return "Success!";
  }
}

// Provider for Riverpod
final authMethodProvider = Provider<AuthMethod>((ref) {
  return AuthMethod();
});
