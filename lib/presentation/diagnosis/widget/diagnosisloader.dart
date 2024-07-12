import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newmedicob/core/colors.dart';
import 'package:gap/gap.dart';
import 'package:newmedicob/core/image_constant.dart';
import 'package:newmedicob/presentation/diagnosis/personal_details.dart';

class DiagnosisLoaderPage extends StatefulWidget {
  const DiagnosisLoaderPage({super.key});

  @override
  State<DiagnosisLoaderPage> createState() => _DiagnosisLoaderPageState();
}

class _DiagnosisLoaderPageState extends State<DiagnosisLoaderPage> {
  @override
  initState() {
    loginsessionUser();
    super.initState();
  }

  void loginsessionUser() async {
    Timer(
        const Duration(seconds: 5),
        () => Get.to(transition: Transition.circularReveal, PersonalFormDiagnosis()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () => Get.back(), icon: Icon(Icons.close)),
      ),
      backgroundColor: WHITE,
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(ImageConstant.robotLogo))),
            ),
            Gap(50),
            const SpinKitFadingCircle(
              color: PRIMARYCOLOR,
              duration: Duration(seconds: 2),
              size: 40.0,
            ),
            Gap(20),
            Text(
              "Loading patient diagnosis Page.",
              style: GoogleFonts.poppins(
                  fontSize: 15,
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
