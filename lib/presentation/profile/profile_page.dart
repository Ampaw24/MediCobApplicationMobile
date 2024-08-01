import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newmedicob/core/app_export.dart';
import 'package:newmedicob/core/colors.dart';
import 'package:newmedicob/core/functions.dart';
import 'package:newmedicob/core/image_constant.dart';
import 'package:newmedicob/presentation/Authentication/login/login.dart';
import 'package:newmedicob/presentation/Homepage/model/usermodel.dart';
import 'package:newmedicob/presentation/profile/profile_widget.dart';
import 'package:newmedicob/presentation/profile/provider/darktheme_provider.dart';
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
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
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
                  weighValue: "${calculateAge(DateTime.parse(user!.dob!))} yrs",
                  weighDescription: "Age",
                ),
              ],
            ),
            const Gap(20),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 30),
              child: Text(
                "Account Settings",
                style: TextStyle(
                  color: themeChange.darkTheme ? Colors.white : Colors.black,
                ),
              ),
            ),
            _buildSettingItem(
              context,
              title: "Notifications",
              description: "Receive alerts and notices",
              icon: Iconsax.notification,
              color: Colors.purple,
              onTap: () {},
            ),
            _buildSettingItem(
              context,
              title: "Reset Password",
              description: "Change your account password",
              icon: Iconsax.password_check,
              color: Colors.blue,
              onTap: () {},
            ),
            _buildSettingItem(
              context,
              title: "Theme",
              description: "Change App Theme",
              icon: Iconsax.moon,
              color: Colors.black,
              onTap: () {},
              trailWidget: Switch(
                splashRadius: 10,
                activeColor: PRIMARYCOLOR,
                value: themeChange.darkTheme,
                onChanged: (value) {
                  setState(() {
                    themeChange.darkTheme = !themeChange.darkTheme;
                  });
                },
              ),
            ),
            _buildSettingItem(
              context,
              title: "Logout",
              description: "Logout from account",
              icon: Iconsax.logout,
              color: Colors.green,
              onTap: _logout,
            ),
            _buildSettingItem(
              context,
              title: "Delete Account",
              description: "Delete your account permanently",
              icon: Iconsax.profile_delete,
              color: Colors.red,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    Widget? trailWidget,
  }) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      margin: const EdgeInsets.only(top: 15, right: 10, left: 10),
      height: 76,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: themeChange.darkTheme
            ? Color.fromARGB(194, 67, 66, 66)
            : Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: profilewidgetIcon(
        isCircular: true,
        isIcon: true,
        color: color.withOpacity(0.2),
        icon: Icon(
          icon,
          size: 16,
          color: color,
        ),
        submessage: description,
        userName: title,
        tap: onTap,
        trail: trailWidget,
      ),
    );
  }

  Future<void> _logout() async {
    ArtDialogResponse response = await ArtSweetAlert.show(
      barrierDismissible: false,
      context: context,
      artDialogArgs: ArtDialogArgs(
        denyButtonText: "Cancel",
        title: "Are you sure?",
        confirmButtonColor: Colors.blue,
        text: "Do you want to log out of this account?",
        confirmButtonText: "Logout",
        type: ArtSweetAlertType.warning,
      ),
    );

    if (response.isTapConfirmButton) {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      _auth.signOut().then((_) async {
        SharedPreferences sp = await SharedPreferences.getInstance();
        await sp.setBool('isLogin', false);

        Get.offAll(() => LoginPage());
      });
    }
  }
}
