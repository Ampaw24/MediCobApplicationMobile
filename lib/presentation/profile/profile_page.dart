import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newmedicob/core/image_constant.dart';
import 'package:newmedicob/presentation/Authentication/login/login.dart';
import 'package:newmedicob/presentation/Homepage/model/usermodel.dart';
import 'package:newmedicob/presentation/profile/profile_widget.dart';
import 'package:newmedicob/presentation/profile/widget/detail_card.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 25,
        centerTitle: true,
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(fontSize: 15),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            profilewidget(
              color: Colors.white,
              isCircular: true,
              imagepath: ImageConstant.logo,
              submessage: "May You live healthy!",
              userName: auth!.displayName!,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DetailProfileCard(
                  weighValue: "${user?.height!} cm",
                  weighDescription: "Height",
                ),
                DetailProfileCard(
                  weighValue: "${user?.weight!} KG",
                  weighDescription: "Weight",
                ),
                DetailProfileCard(
                  weighValue: "${calculateAge(DateTime.now())} yrs",
                  weighDescription: "Age",
                ),
              ],
            ),
            const Gap(20),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 30),
              child: Text(
                "Account Settings",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, right: 10, left: 10),
              height: 76,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xffF8F8F8),
                  borderRadius: BorderRadius.circular(10)),
              child: profilewidgetIcon(
                isCircular: true,
                isIcon: true,
                color: Color(0xffF8F8F8),
                submessage: "Recieve alerts and Notice",
                userName: "Notifications",
                tap: () {},
                icon: Icon(
                  Iconsax.notification,
                  size: 16,
                  color: Colors.purple,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, right: 10, left: 10),
              height: 76,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xffF8F8F8),
                  borderRadius: BorderRadius.circular(10)),
              child: profilewidgetIcon(
                tap: () {},
                isIcon: true,
                isCircular: true,
                color: Colors.blue[100] as Color,
                icon: Icon(
                  Iconsax.password_check,
                  size: 16,
                  color: Colors.blue,
                ),
                submessage: "Change your account password",
                userName: "Reset Password",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, right: 10, left: 10),
              height: 76,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xffF8F8F8),
                  borderRadius: BorderRadius.circular(10)),
              child: profilewidgetIcon(
                tap: () async {
                  ArtDialogResponse response = await ArtSweetAlert.show(
                      barrierDismissible: false,
                      context: context,
                      artDialogArgs: ArtDialogArgs(
                          denyButtonText: "Cancel",
                          title: "Are you sure?",
                          confirmButtonColor: Colors.blue,
                          text: "Do yuo want to logout this Account!",
                          confirmButtonText: "Logout",
                          type: ArtSweetAlertType.warning));

                  if (response.isTapConfirmButton) {
                    final FirebaseAuth _auth = FirebaseAuth.instance;
                    _auth.signOut().then((_) async {
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      await sp.setBool('isLogin', false);
                      print(sp.getBool('isLogin'));
                      Get.to(LoginPage());
                    });
                  }
                },
                isIcon: true,
                isCircular: true,
                color: Colors.green[100] as Color,
                icon: Icon(
                  Iconsax.logout,
                  size: 16,
                  weight: 20,
                  color: Colors.green,
                ),
                submessage: "Logout From Account",
                userName: "Logout",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, right: 10, left: 10),
              height: 76,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xffF8F8F8),
                  borderRadius: BorderRadius.circular(10)),
              child: profilewidgetIcon(
                isIcon: true,
                isCircular: true,
                color: Colors.red[100] as Color,
                icon: Icon(
                  Iconsax.profile_delete,
                  color: Colors.red,
                  size: 16,
                ),
                submessage: "Change your account password",
                userName: "Delete Account",
              ),
            ),
          ],
        ),
      ),
    );
  }

  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;

    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
}
