import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newmedicob/core/app_export.dart';
import 'package:newmedicob/core/colors.dart';
import 'package:newmedicob/core/image_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:newmedicob/core/network/firebase_provider.dart';
import 'package:newmedicob/core/textstyles.dart';
import 'package:newmedicob/presentation/diagnosis/widget/diagnosisloader.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    final user = FirebaseAuth.instance.currentUser;
context.read<FirebaseProvider>()
        .FetchUserOutline(dbName: "users", uid: user!.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 85,
        leading: Container(
            margin: const EdgeInsets.only(left: 20, top: 15),
            child: Image.asset(ImageConstant.logo)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello ${user?.displayName}",
              style: GoogleFonts.poppins(
                  color: PRIMARYCOLOR,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "May you always be healthy",
              style: GoogleFonts.poppins(
                  color: PRIMARYLIGHT,
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          splashColor: PRIMARYLIGHT.withOpacity(0.3),
          elevation: 4,
          backgroundColor: WHITE,
          onPressed: () {
            Get.to(transition: Transition.downToUp, DiagnosisLoaderPage());
          },
          child: Image.asset(
            ImageConstant.robotLogo,
            fit: BoxFit.cover,
          )),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBMISection(),
            const SizedBox(height: 16),
            _buildRecommendationTopics(),
          ],
        ),
      ),
    );
  }

  Widget _buildBMISection() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageConstant.bannerBackground),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(30),
              Text('BMI (Body Mass Index)',
                  style: GoogleFonts.poppins(
                      fontSize: 13, fontWeight: FontWeight.bold, color: WHITE)),
              Text('You have a normal weight', style: bannerTextWhite2),
              Container(
                margin: const EdgeInsets.only(top: 20, right: 15),
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                    gradient: DEEPBUTTONGRADIENT,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    "Check More",
                    style: bannerTextWhite2,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildRecommendationTopics() {
    return _buildRecommendationItem(
        title: 'Hello',
        author: "Safo Ampaw",
        imageUrl: ImageConstant.robotLogo,
        daysAgo: 2);
  }

  Widget _buildRecommendationItem({
    required String title,
    required String author,
    required int daysAgo,
    required String imageUrl,
  }) =>
      Card(
        elevation: 3.0,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          decoration: BoxDecoration(
              color: WHITE, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20),
                width: MediaQuery.of(context).size.width * 0.6,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(10),
                    Text(
                      "Title goes here",
                      style: GoogleFonts.poppins(
                          color: PRIMARYCOLOR,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    const Gap(5),
                    Text(
                      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Illum molestiae qui, voluptas corporis placeat facilis quaerat. Ex dolorum ullam hic corporis exercitationem laborum repellat repellendus consequuntur quos itaque! Fugit, molestias.",
                      style: GoogleFonts.poppins(
                          color: rederPurpDeep,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.registerhealthimg),
                        fit: BoxFit.contain),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),
        ),
      );
}
