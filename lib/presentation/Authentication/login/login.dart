import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newmedicob/core/app_export.dart';
import 'package:newmedicob/core/colors.dart';
import 'package:newmedicob/core/network/firebase_provider.dart';
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
  bool _isLoading = false;
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
      child: Stack(
        children: [
          Scaffold(
            body: loginWidget(
                emailController: _emailController,
                emailFocusNode: _emailFocusNode,
                onForgetPassword: () {},
                onLogin: _onLogin,
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
          if (_isLoading)
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                color: Colors.black.withOpacity(0.3),
                child: Center(
                    child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: WHITE,
                  ),
                  child: Column(children: [
                    SpinKitCircle(
                      color: PRIMARYCOLOR,
                    ),
                    Gap(5),
                    Text(
                      "Please Wait ..",
                      style: GoogleFonts.roboto(
                        color: PRIMARYCOLOR,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ]),
                )),
              ),
            ),
        ],
      ),
    );
  }

  void _onLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        await context.read<FirebaseProvider>().signInUser(
              email: _emailController.text.trim(),
              password: _passwordController.text,
              context: context,
            );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
