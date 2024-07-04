import 'package:flutter/material.dart';

import 'widget/loginWidget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FocusNode? _emailFocusNode, _passwordFocusNode;
  final bool _isLoading = false;
  bool _seePassword = false;
  @override
  initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  dispose() {
    super.dispose();
    _emailFocusNode!.dispose();
    _passwordFocusNode!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: loginWidget(
            emailController: _emailController,
            emailFocusNode: _emailFocusNode,
            onForgetPassword: () {},
            onLogin: () {},
            passwordController: _passwordController,
            passwordFocusNode: _passwordFocusNode,
            key: _formKey,
            context: context,
            obsecureText: _seePassword,
            changeob: () {
              setState(() {
                _seePassword = !_seePassword;
              });
            },
            isLoading: _isLoading),
      ),
    );
  }
}


  // void _onLogin() async {
  //   _emailFocusNode!.unfocus();
  //   _passwordFocusNode!.unfocus();

  //   if (_formKey.currentState!.validate()) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     Map<String, dynamic> httpResult = await httpChecker(
  //       httpRequesting: () => httpRequesting(
  //         useHeader: false,
  //         endPoint: APIServices.loginUrl,
  //         method: httpMethod.post,
  //         httpPostBody: {
  //           'email': _emailController.text,
  //           'password': _passwordController.text,
  //         },
  //       ),
  //     );
  //     if (httpResult['ok']) {
  //       pasaUsermodel = PasaUser.fromJson(httpResult['data']);
  //       print(httpResult);
  //       await saveStringShare(
  //         key: "userDetails",
  //         data: jsonEncode(httpResult['data']),
  //       );
  //       await saveBoolShare(key: "auth", data: true);
  //       setState(() => _isLoading = false);
  //       navigateAndRemoveRoute(context: context, pageName: SettingsPage());
  //     } else {
  //       setState(() => _isLoading = false);
  //       print(httpResult);
  //       httpResult["statusCode"] == 200
  //           ? toastContainer(
  //               text: "Wrong username or password",
  //               backgroundColor: RED,
  //             )
  //           : toastContainer(
  //               text: httpResult["error"],
  //               backgroundColor: RED,
  //             );
  //     }
  //   }
  //   ;
  // }
//}
