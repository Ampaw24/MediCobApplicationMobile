import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:newmedicob/core/spec/buttomnavbar.dart';
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
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      final registerData = {
        "email": email.trim(),
        "firstName": firstName,
        "last_name": lastName,
        "dateCreated":
            userCredential.user!.metadata.creationTime?.toString() ?? "",
      };

      await userCredential.user!.updateProfile(
        displayName: "$firstName $lastName",
      );

      await _userRef.child(userCredential.user!.uid).set(registerData);

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
          email: email, password: password);
      final userMap = {
        "username":userCredential.user!.displayName,
      };
      await sp.setBool('isLogin', true);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const BTNAV()));
    
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Invalid user"),
            backgroundColor: Colors.red,
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("wrong Email or Password"),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text("An error occured while logging in user. Try again.."),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
