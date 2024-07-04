import 'package:flutter/material.dart';

import 'widget/registerwidget.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State {
  final bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  FocusNode? _emailFocusNode,
      _passwordFocusNode,
      firstnameFocusNode,
      surnameFocusNode,
      _confirmPasswordFocusNode;

  @override
  initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  dispose() {
    _emailFocusNode!.dispose();
    _passwordFocusNode!.dispose();
    _confirmPasswordFocusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: RegisterWidget(
            emailController: _emailController,
            emailFocusNode: _emailFocusNode,
            firstnameFocusNode: firstnameFocusNode,
            firstnameController: _firstnameController,
            surnameController: _surnameController,
            surnameFocusNode: surnameFocusNode,
            confirmPasswordController: _confirmPasswordController,
            confirmPasswordFocusNode: _confirmPasswordFocusNode,
            PasswordController: _passwordController,
            PasswordFocusNode: _passwordFocusNode,
            onForgetPassword: () {},
            onRegister: () {},
            passwordController: _passwordController,
            passwordFocusNode: _passwordFocusNode,
            key: _formKey,
            context: context,
            isLoading: _isLoading),
      ),
    );
  }
   
  // void _onRegister() async {
  //   if (_formKey.currentState!.validate()) {
  //     if (_passwordController.text != _confirmPasswordController.text) {
  //       toastContainer(
  //         text: "Password and Confirm password fields do not match",
  //         backgroundColor: Colors.red,
  //       );
  //       FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
  //       return; // Exit the function if passwords do not match
  //     }
  //     setState(() => _isLoading = true);
  //     final map = {
  //       'fname': _firstnameController.text,
  //       'lname': _surnameController.text,
  //       'email': _emailController.text,
  //       'password': _passwordController.text,
  //       'password_confirmation': _confirmPasswordController.text,
  //     };
  //     final result = await httpChecker(
  //       httpRequesting: () => httpRequesting(
  //         useHeader: false,
  //         endPoint: APIServices.register,
  //         method: httpMethod.post,
  //         httpPostBody: map,
  //       ),
  //     );

  //     if (result['ok']) {
  //       pasaUsermodel = PasaUser.fromJson(result['data']);
  //       await saveStringShare(
  //         key: "userDetails",
  //         data: jsonEncode(result['data']),
  //       );
  //       await saveBoolShare(key: "auth", data: true);
  //       toastContainer(
  //         text: "Registration success",
  //         backgroundColor: GREEN,
  //       );
  //       setState(() => _isLoading = false);
  //       navigateAndRemoveRoute(context: context, pageName: LoginPage());
  //     } else {
  //       setState(() => _isLoading = false);
  //       switch (result["statusCode"]) {
  //         case 422:
  //           String errorMessage = "Unknown error";
  //           if (result.containsKey('data') &&
  //               result['data'].containsKey('error_all')) {
  //             List<dynamic> errorAllList = result['data']['error_all'];
  //             errorMessage =
  //                 errorAllList.join(", "); // Join the list into a single string
  //           }
  //           toastContainer(
  //             text: "Validation error: " + errorMessage,
  //             backgroundColor: Colors.red,
  //           );
  //           print(result);
  //           break;
  //         case 500:
  //           toastContainer(
  //             text: "Server error, please try again later",
  //             backgroundColor: Colors.red,
  //           );
  //           break;
  //         case 200:
  //           toastContainer(
  //             text: result["error"],
  //             backgroundColor: Colors.indigo,
  //           );
  //           break;
  //         default:
  //       }
  //     }
  //   }
  // }
}
