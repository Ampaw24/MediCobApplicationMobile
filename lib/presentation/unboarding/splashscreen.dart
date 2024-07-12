import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/image_constant.dart';
import '../../core/progress_dialog_utils.dart';
import '../Authentication/login/login.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  initState() {
    loginsessionUser();
    super.initState();
  }

  void loginsessionUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? isLogin = sp.getBool('isLogin') ?? false;

    if (isLogin) { 
      Timer(
          const Duration(seconds: 5),
          () => Navigator.of(context).pushReplacement(
              CupertinoPageRoute(builder: (context) => const LoginPage())));
    } else {
      Timer(
          const Duration(seconds: 5),
          () => Navigator.of(context).pushReplacement(
              CupertinoPageRoute(builder: (context) => const LoginPage()))); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageConstant.splashpaper),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SpinKitWave(
              color: Colors.white,
              duration: Duration(seconds: 2),
              size: 30.0,
            ),
            GestureDetector(
              onTap: () {
                ProgressDialogUtils.showProgressDialog();
              },
              child: const SizedBox(
                height: 40,
              ),
            ),
            Text(
              "Version 1.0",
              style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
