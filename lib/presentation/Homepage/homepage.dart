import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newmedicob/core/app_export.dart';
import 'package:newmedicob/core/colors.dart';
import 'package:newmedicob/core/functions.dart';
import 'package:newmedicob/core/image_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:newmedicob/core/network/firebase_provider.dart';
import 'package:newmedicob/core/textstyles.dart';
import 'package:newmedicob/presentation/Homepage/provider/healthdata_fetch.dart';
import 'package:newmedicob/presentation/diagnosis/personal_details.dart';
import 'package:newmedicob/presentation/profile/provider/darktheme_provider.dart';
import 'package:newmedicob/presentation/vital%20Check/BMI/main_screen.dart';
import 'package:newmedicob/presentation/Homepage/model/usermodel.dart';
import 'package:newmedicob/presentation/diagnosis/widget/diagnosisloader.dart';
import 'package:shimmer/shimmer.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<Map<String, dynamic>> _userOutlineFuture;

  @override
  void initState() {
    super.initState();

    final user = FirebaseAuth.instance.currentUser;
    _userOutlineFuture = context
        .read<FirebaseProvider>()
        .FetchUserOutline(dbName: "users", uid: user!.uid);
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final buildTips = context.read<FetchHealthTipProvider>();
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
              "Hello ${FirebaseAuth.instance.currentUser?.displayName}",
              style: GoogleFonts.poppins(
                  color: themeChange.darkTheme ? WHITE : PRIMARYCOLOR,
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
          onPressed: () => Get.to(
              transition: Transition.downToUp, () => PersonalFormDiagnosis()),
          child: Image.asset(
            ImageConstant.robotLogo,
            fit: BoxFit.cover,
          )),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _userOutlineFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: PRIMARYCOLOR,
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final user = UserModel.fromJson(snapshot.data!);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBMISection(user),
                  const SizedBox(height: 16),
                  Expanded(
                    child: FutureBuilder(
                      future: Future.delayed(
                          Duration(seconds: 5)), // delay for 5 seconds
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return RefreshIndicator(
                            color: themeChange.darkTheme ? PRIMARYCOLOR : WHITE,
                            backgroundColor:
                                themeChange.darkTheme ? WHITE : PRIMARYLIGHT,
                            onRefresh: () async {},
                            child: ListView.builder(
                              itemCount: buildTips.health_TipsList.length,
                              itemBuilder: (context, index) {
                                return _buildRecommendationItem(
                                  author: buildTips
                                      .health_TipsList[index].description,
                                  title: buildTips.health_TipsList[index].title,
                                  daysAgo:
                                      buildTips.health_TipsList[index].daysAgo,
                                  imageUrl: ImageConstant.robotLogo,
                                );
                              },
                            ),
                          );
                        } else {
                          return shimmerList(itemCount: 10);
                        }
                      },
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  Widget _buildBMISection(UserModel user) {
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
              Text('BMI (${user.bmi}kg/m²)',
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.bold, color: WHITE)),
              Text(interpretBMI(double.parse(user.bmi!)),
                  style: bannerTextWhite2),
              GestureDetector(
                onTap: () =>
                    Get.to(() => BMIChecker(), transition: Transition.fadeIn),
                child: Container(
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
                ),
              )
            ],
          )
        ],
      ),
    );
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
          height: 130,
          decoration: BoxDecoration(
              color: WHITE, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20),
                width: MediaQuery.of(context).size.width * 0.55,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(10),
                    AutoSizeText(
                      title,
                      maxFontSize: 15,
                      minFontSize: 12,
                      style: GoogleFonts.poppins(
                        color: PRIMARYCOLOR,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(5),
                    AutoSizeText(
                      author,
                      maxLines: 5,
                      style: GoogleFonts.poppins(
                          color: rederPurpDeep,
                          fontWeight: FontWeight.w500,
                          fontSize: 10),
                    ),
                    const Gap(10),
                    AutoSizeText(
                      "$daysAgo Days Ago",
                      maxLines: 5,
                      maxFontSize: 12,
                      minFontSize: 10,
                      style: GoogleFonts.poppins(
                        color: rederPurpDeep,
                        fontWeight: FontWeight.w700,
                      ),
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

  /// Displays a list of shimmer items
  Widget shimmerList({
    required int itemCount, // number of shimmer items to show
    double itemHeight = 100, // height of each shimmer item
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300] as Color,
      highlightColor: Colors.grey[100] as Color,
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: itemHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
