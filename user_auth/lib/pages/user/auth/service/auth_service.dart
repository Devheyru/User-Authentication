import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //for sign up
  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      if (email.isEmpty || name.isEmpty || password.isEmpty) {
        return "plese fill all fields";
      }
      //create user
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //store created user
      await _firestore.collection("users").doc(cred.user!.uid).set({
        "name": name,
        "email": email,
        "uid": cred.user!.uid,
        "createdAt": FieldValue.serverTimestamp(),
      });
      return "Success";
    } catch (e) {
      return (e.toString());
    }
  }
  //for login

  Future<String> LoginUser({
    required String email,
    required String password,
  }) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        return "plese fill all fields";
      }
      //create user
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      return "Success";
    } catch (e) {
      return (e.toString());
    }
  }

  //log out
  Future<String> signOut() async {
    await _auth.signOut();
    return "Success!";
  }
}

final AuthMethodProvider = Provider<AuthMethod>((ref) {
  return AuthMethod();
});
