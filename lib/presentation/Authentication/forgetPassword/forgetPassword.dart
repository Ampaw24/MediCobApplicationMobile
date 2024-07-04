// import 'dart:convert';

// import 'package:pasa_mobile/components/customLoading.dart';
// import 'package:flutter/material.dart';
// import 'package:pasa_mobile/components/toast.dart';
// import 'package:pasa_mobile/config/http/httpChecker.dart';
// import 'package:pasa_mobile/config/http/httpRequester.dart';
// import 'package:pasa_mobile/config/navigation.dart';
// import 'package:pasa_mobile/config/services.dart';
// import 'package:pasa_mobile/models/pasaModels/ResetTokenmodel.dart';
// import 'package:pasa_mobile/pages/authentication/otppage/otppage.dart';
// import 'package:pasa_mobile/specs/colors.dart';
// import '../../../config/sharePreference.dart';
// import '../login/login.dart';
// import 'widget/forgetPasswordWidget.dart';

// class ForgetPassword extends StatefulWidget {
//   @override
//   _ForgetPasswordState createState() => _ForgetPasswordState();
// }

// class _ForgetPasswordState extends State<ForgetPassword> {
//   bool _isLoading = false;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();

//   FocusNode? _emailFocusNode;

//   initState() {
//     super.initState();
//     _emailFocusNode = new FocusNode();
//   }

//   dispose() {
//     super.dispose();
//     _emailFocusNode!.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: WHITE,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.close),
//           onPressed: () =>
//               navigateAndRemoveRoute(context: context, pageName: LoginPage()),
//         ),
//       ),
//       body: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: Stack(
//           children: [
//             forgetPasswordWidget(
//               emailController: _emailController,
//               emailFocusNode: _emailFocusNode,
//               key: _formKey,
//               onResetPassword: () => _onForgotPassword(),
//               context: context,
//             ),
//             if (_isLoading) customLoadingPage()
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _onForgotPassword() async {
//     _emailFocusNode!.unfocus();
//     if (_formKey.currentState!.validate()) {
//       setState(() => _isLoading = true);
//       Map<String, dynamic> httpResult = await httpChecker(
//         httpRequesting: () => httpRequesting(
//           endPoint: APIServices.resetToken,
//           method: httpMethod.post,
//           httpPostBody: {"email": _emailController.text},
//         ),
//         showToastMsg: false,
//       );
//       print("$httpResult");
//       if (httpResult["ok"]) {
//         resettoken = Resettokenmodel.fromJson(httpResult['data']);
//         await saveStringShare(
//           key: "Otprec",
//           data: jsonEncode(httpResult['data']),
//         );
//         await saveBoolShare(key: "auth", data: true);
//         toastContainer(
//           text: httpResult["data"]["msg"],
//         );
//         Navigator.of(context).pushAndRemoveUntil(
//             MaterialPageRoute(
//               builder: (context) => OtpPage(),
//             ),
//             (Route<dynamic> route) => false);
//       } else {
//         setState(() => _isLoading = false);
//         httpResult["statusCode"] == 200
//             ? toastContainer(
//                 text: httpResult["data"]["msg"],
//                 backgroundColor: RED,
//               )
//             : toastContainer(text: httpResult["error"], backgroundColor: RED);
//       }
//     }
//   }
// }
