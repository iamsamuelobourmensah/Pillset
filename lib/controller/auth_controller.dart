import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  
  Future<String> createNewAccount(
      String email, String password, String fullName) async {
    String response = "Ohpss something went wrong";

    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      response = "success";
      await _firebaseFirestore
          .collection("clients")
          .doc(userCredential.user!.uid)
          .set({
        "profilePicture": "",
        "email": email,
        "fullName": fullName,
        "about": "",
        "userId": userCredential.user!.uid
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        response = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        response = 'The account already exists for that email.';
      }
    }
    return response;
  }
  //END OF CREATING AN ACCOUNT

  Future<String> signInUser(String email, String password) async {
    String response = "Oppss something went wrong";
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      response = "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        response = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        response = 'Wrong password provided for that user.';
      }
    }
    return response;
  }
}
