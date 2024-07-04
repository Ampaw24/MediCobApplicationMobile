// import 'dart:io';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/widgets.dart';

// class FirebaseUtils extends ChangeNotifier {
//   //Fetching courses
//   Future<Map> FetchCourseOutline({required String dbName}) async {
//     try {
//       FirebaseDatabase.instance.setPersistenceEnabled(true);
//       DatabaseReference ref = FirebaseDatabase.instance.ref(dbName);
//       DatabaseEvent event = await ref.once();
//       Map courses = event.snapshot.value as Map;
//       print(courses);
//       return courses;
//     } on SocketException catch (e) {
//       throw SocketException('No Internet connection $e');
//     } catch (e) {
//       throw Exception('Failed to load course outline');
//     }
//   }

//   Future<dynamic> FetchContentOutline({required String dbName}) async {
//     try {
//       FirebaseDatabase.instance.setPersistenceEnabled(true);
//       DatabaseReference ref =
//           FirebaseDatabase.instance.ref("$dbName/Contents");
//       DatabaseEvent event = await ref.once();
//       var contents = event.snapshot.value;
//       print("Newbie $contents");
//       return contents;
//     } on SocketException catch (e) {
//       throw SocketException('No Internet connection $e');
//     } catch (e) {
//       throw Exception('Failed to load course outline: $e');
//     }
//   }
// }
