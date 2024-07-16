import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newmedicob/core/app_export.dart';
import 'package:newmedicob/core/network/firebase_provider.dart';
import 'package:newmedicob/presentation/Authentication/login/login.dart';
import 'package:newmedicob/presentation/Authentication/register/complete_registery.dart';
import '../../../core/colors.dart';
import 'widget/registerwidget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State {
  bool _isLoading = false;
  bool isLoading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _seePassword = false;


  FocusNode? _emailFocusNode,
      _passwordFocusNode,
      firstnameFocusNode,
      surnameFocusNode,
      _confirmPasswordFocusNode;

  @override
  initState() {
    super.initState();
    firstnameFocusNode = FocusNode();
    surnameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  dispose() {
    _emailFocusNode!.dispose();
    firstnameFocusNode!.dispose();
    _passwordFocusNode!.dispose();
    _confirmPasswordFocusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        children: [
          Scaffold(
            body: RegisterWidget(
                emailController: _emailController,
                emailFocusNode: _emailFocusNode,
                firstnameFocusNode: firstnameFocusNode,
                firstnameController: _firstnameController,
                surnameController: surnameController,
                surnameFocusNode: surnameFocusNode,
                confirmPasswordController: _confirmPasswordController,
                confirmPasswordFocusNode: _confirmPasswordFocusNode,
                PasswordController: _passwordController,
                PasswordFocusNode: _passwordFocusNode,
                onForgetPassword: () {},
                onRegister: _onRegister,
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
        ],
      ),
    );
  }

  void _onRegister() async {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text != _confirmPasswordController.text) {
        FocusScope.of(context).unfocus();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text("Password and Password confirmation fields do not match"),
            backgroundColor: Colors.red,
          ),
        );
        FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
        return;
      }

      final userDetails = {
        "email": _emailController.text,
        "password": _passwordController.text,
        "firstName": _firstnameController.text,
        "lastName": surnameController.text,
      };

      Get.to(
          () => CRegisterPage(
                userMap: userDetails,
              ),
          transition: Transition.cupertino);
    }
  }
}
