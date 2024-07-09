import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newmedicob/core/image_constant.dart';
import 'package:newmedicob/presentation/profile/profile_widget.dart';
import 'package:newmedicob/presentation/profile/widget/detail_card.dart';
import 'package:gap/gap.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? username = "";
  @override
  void initState() {
    //loadUserData();
    super.initState();
  }

  // loadUserData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   username = prefs.getString("username");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          profilewidget(
            color: Colors.white,
            isCircular: true,
            imagepath: ImageConstant.logo,
            submessage: "May You live healthy!",
            userName: "Ampaw Justice ",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              DetailProfileCard(
                weighValue: "180 cm",
                weighDescription: "Height",
              ),
              DetailProfileCard(
                weighValue: "200 KG",
                weighDescription: "Weight",
              ),
              DetailProfileCard(
                weighValue: "18 yrs",
                weighDescription: "Age",
              ),
            ],
          ),
          const Gap(30),
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
            child: profilewidget(
              color: Color(0xffFFD88D),
              isCircular: true,
              imagepath: "assets/images/profileimgg.png",
              submessage: "",
              userName: " ",
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
                // ArtDialogResponse response = await ArtSweetAlert.show(
                //     barrierDismissible: false,
                //     context: context,
                //     artDialogArgs: ArtDialogArgs(
                //         denyButtonText: "Cancel",
                //         title: "Are you sure?",
                //         confirmButtonColor: Colors.blue,
                //         text: "Do yuo want to logout this Account!",
                //         confirmButtonText: "Logout",
                //         type: ArtSweetAlertType.warning));

                // if (response.isTapConfirmButton) {
                //   await logout.logout(context);
                // }
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
    );
  }
}
