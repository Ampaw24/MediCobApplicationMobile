// import 'package:flutter/material.dart';
// import 'package:pasa_mobile/components/button.dart';
// import 'package:pasa_mobile/components/textField.dart';
// import 'package:pasa_mobile/specs/colors.dart';
// import 'package:pasa_mobile/specs/strings.dart';
// import 'package:pasa_mobile/specs/styles.dart';

// Widget forgetPasswordWidget({
//   @required TextEditingController? emailController,
//   @required FocusNode? emailFocusNode,
//   @required void Function()? onResetPassword,
//   @required Key? key,
//   required BuildContext? context,
// }) {
//   return Container(
//     padding: EdgeInsets.only(
//       left: 15.0,
//       right: 15.0,
//     ),
//     // alignment: Alignment.center,
//     child: SingleChildScrollView(
//       child: Form(
//         key: key,
//         child: Column(
//           // mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.start,
//           // crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset('assets/images/frg.png'),
//             Text("Forgotten Your Password ?", style: h4BlackBold),
//             SizedBox(height: 20),
//             Text(FORGETPASSWORDMSG, style: h4Black),
//             SizedBox(height: 10),
//             textFormField(
//               controller: emailController,
//               focusNode: emailFocusNode,
//               hintText: "Email Address",
//               validateEmail: true,
//               validateMsg: REQUIREDFIELDMSG,
//               inputType: TextInputType.emailAddress,
//               showBorderRound: false,
//             ),
//             SizedBox(height: 30),
//             ButtonTheme(
//               minWidth: 500,
//               height: 50,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: button(
//                 onPressed: () => onResetPassword!(),
//                 text: "Reset Password",
//                 color: PRIMARYCOLOR,
//                 context: context,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
