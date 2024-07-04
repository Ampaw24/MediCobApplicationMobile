// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:pasa_mobile/config/deleteCache.dart';
// import 'package:pasa_mobile/config/http/httpChecker.dart';
// import 'package:pasa_mobile/config/http/httpRequester.dart';
// import 'package:pasa_mobile/config/services.dart';
// import 'package:pasa_mobile/models/pasaModels/usermodel.dart';
// import 'package:pasa_mobile/pages/authentication/login/login.dart';
// import '../../config/sharePreference.dart';

// Future logout(BuildContext context) async {
//   try {
//     Navigator.pushReplacement(
//         context, CupertinoPageRoute(builder: (context) => LoginPage()));
//     Map<String, dynamic> httpResult = await httpChecker(
//       httpRequesting: () => httpRequesting(
//         useHeader: true,
//         endPoint: APIServices.logout,
//         method: httpMethod.post,
//         httpPostBody: {"email": pasaUsermodel!.data!.email},
//       ),
//     );

//     if (httpResult["ok"]) {
//       saveBoolShare(key: 'auth', data: false);
//       await deleteCache();
//       Navigator.push(
//           context,
//           CupertinoDialogRoute(
//               builder: (_) => LoginPage(),
//               context: context)); // Replace with your login route name
//     } else {
//       print(httpResult);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Logout failed'),
//         ),
//       );
//     }
//   } catch (error) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Error: $error'),
//       ),
//     );
//   }
// }

// Future DeleteAccount(BuildContext context, String? id) async {
//   try {
//     Map<String, dynamic> httpResult = await httpChecker(
//       httpRequesting: () => httpRequesting(
//         useHeader: false,
//         endPoint: '${APIServices.delAccount}${id}',
//         method: httpMethod.post,
//       ),
//     );

//     if (httpResult["ok"]) {
//       saveBoolShare(key: 'auth', data: false);
//       await deleteCache();
//       Navigator.push(
//           context,
//           CupertinoDialogRoute(
//               builder: (_) => LoginPage(),
//               context: context)); // Replace with your login route name
//     } else {
//       print(httpResult);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Account Delete failed'),
//         ),
//       );
//     }
//   } catch (error) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Error: $error'),
//       ),
//     );
//   }
// }
