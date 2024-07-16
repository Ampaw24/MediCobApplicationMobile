import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:newmedicob/core/colors.dart';
import 'package:newmedicob/core/spec/toastcontainer.dart';

class FirestoreProvider with ChangeNotifier {
  void SignUpUserFirebase(
      {required Map<String, dynamic> regData,
      BuildContext? context,
      required String email,
      required String password}) async {
    final _auth = FirebaseAuth.instance;

    try {
      final ref = FirebaseDatabase.instance.ref().child('users');
      final user = FirebaseAuth.instance.currentUser;
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      await ref.child(user!.uid).set(regData).then((_) {
        toastContainer(
            context: context!, msg: "Registeration success", color: GREEN);
      });

      if (kDebugMode) {
        print(userCredential);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastContainer(
            context: context!, msg: "Weak Password Entered", color: RED);
      } else if (e.code == 'email-already-in-use') {
        toastContainer(
            context: context!, msg: "Email already registered", color: RED);
      }
    } catch (e) {
      toastContainer(context: context!, msg: e.toString(), color: RED);
    }
  }

  // Future<void> pushUserdataToRealtime(
  //     {required Map<String, dynamic> regData, required String dbName}) async {
  //   var ref = FirebaseDatabase.instance.ref(dbName);
  //   await ref.push().set(regData);
  // }

//   try {
//   UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//     email: "barry.allen@example.com",
//     password: "SuperSecretPassword!"
//   );
// } on FirebaseAuthException catch (e) {
//   if (e.code == 'user-not-found') {
//     print('No user found for that email.');
//   } else if (e.code == 'wrong-password') {
//     print('Wrong password provided for that user.');
//   }
// }

  // final _firestore = FirebaseFirestore.instance;
  // FireAuth fireAuth = FireAuth();

  // Stream<QuerySnapshot<Map<String, dynamic>>> getStreamCandidates() {
  //   return _firestore.collection('CandidatesCollection').snapshots();
  // }

  // final _presidentialCollection =
  //     FirebaseDatabase.instance.ref('PresidentialCandidates');

  // DatabaseReference getCollectionRealtime(String table) {
  //   return FirebaseDatabase.instance.ref(table);
  // }

  // Future logUserOut() async {
  //   await fireAuth.signOut();
  //   await saveBoolShare(key: "auth", data: false);
  //   await deleteCache();
  //   notifyListeners();
  // }

  String get userMail => FirebaseAuth.instance.currentUser!.email.toString();
  String get userDispalyName =>
      FirebaseAuth.instance.currentUser!.displayName.toString();

  Future<String> getUserDetails() async {
    FirebaseAuth.instance.currentUser!.email;

    return getUserDetails();
  }
  //Add Data to firebase firestore

  Future updateVoteCount(
      String candidateId, int voteCount, String dbName) async {
    String userID = candidateId;
    int updatedVoteCount = voteCount + 1;
    DatabaseReference userRef =
        FirebaseDatabase.instance.ref().child(dbName).child(userID);
    try {
      await userRef.update({
        "vote_count": updatedVoteCount,
      });
      print("Vote count updated: $voteCount to $updatedVoteCount");
    } catch (error) {
      print("Error updating vote count: $error");
    }
  }

  Future IncTotalVotecount(String dbTable) async {
    FirebaseDatabase.instance
        .ref()
        .child(dbTable)
        .set(ServerValue.increment(1));
  }

  //Update user name code ....
  // try {
  //                           if (_passwordController.text ==
  //                               _conpasswordController.text) {
  //                             await FirebaseAuth.instance.currentUser!
  //                                 .updatePassword(_conpasswordController.text)
  //                                 .then((_) => Get.showSnackbar(GetSnackBar(
  //                                       title: "Update Success",
  //                                       message: "User Credentials Updated",
  //                                       snackPosition: SnackPosition.BOTTOM,
  //                                     )));
  //                             _conpasswordController.text = " ";
  //                             _passwordController.text = " ";
  //                           } else {
  //                             Get.showSnackbar(GetSnackBar(
  //                               title: "Error Updating",
  //                               message:
  //                                   "Error Updating User Credentials for User. \n Check password fields",
  //                             ));
  //                             _conpasswordController.text = " ";
  //                             _passwordController.text = " ";
  //                           }
  //                         } catch (e) {
  //                           print("Error Changing Display Name ${e}");
  //                         }

  void updateUserCredential() {}
}
