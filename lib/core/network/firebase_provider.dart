import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newmedicob/core/spec/buttomnavbar.dart';
import 'package:newmedicob/presentation/Authentication/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final DatabaseReference _userRef =
      FirebaseDatabase.instance.ref().child("users");

  Future<void> registerUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required Map<String, dynamic> userDetails,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      await userCredential.user!.updateProfile(
        displayName: "$firstName $lastName",
      );

      await _userRef.child(userCredential.user!.uid).set(userDetails);
      Get.to(() => LoginPage());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Registration successful"),
          backgroundColor: Colors.green,
        ),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      } else if (e.code ==
          'The supplied auth credential is incorrect, malformed or has expired.') {
        errorMessage = 'No account found for this Email';
      } else {
        errorMessage = 'An error occurred. Please try again.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> signInUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

     
      await sp.setBool('isLogin', true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BTNAV()),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = "";
      switch (e.code) {
        case 'user-not-found':
          errorMessage = "Invalid user. Please check your email address.";
          break;
        case 'wrong-password':
          errorMessage = "Incorrect email or password.";
          break;
        case 'invalid-email':
          errorMessage = "Please enter a valid email address.";
          break;
        case 'too-many-requests':
          errorMessage = "Too many login attempts. Please try again later.";
          break;
        case 'operation-not-allowed':
          errorMessage = "Email/password sign-in is disabled.";
          break;
        case 'weak-password':
          errorMessage =
              "Your password is too weak. Please choose a stronger one.";
          break;
        case 'email-already-in-use':
          errorMessage =
              "This email address is already in use. Try signing in or resetting your password.";
          break;
        case 'invalid-credential':
          errorMessage = "wrong email or password!";
          break;
        case 'account-exists-with-different-credential':
          errorMessage =
              "An account already exists with this email address but different sign-in credentials. Sign in using a provider associated with this email address (e.g., Google) or reset your password.";
          break;
        default:
          errorMessage = e.code;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("$error"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
