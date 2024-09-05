import 'package:flutter/material.dart';
import 'package:newmedicob/core/app_export.dart';
import 'package:newmedicob/core/colors.dart';
import 'package:newmedicob/presentation/Homepage/homepage.dart';
import 'package:newmedicob/presentation/profile/provider/darktheme_provider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../presentation/profile/profile_page.dart';
import '../../presentation/records/recordspage.dart';

class BTNAV extends StatelessWidget {
  const BTNAV({Key? key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    List<PersistentBottomNavBarItem> _navBarItems = [
      PersistentBottomNavBarItem(
        icon: const Icon(
          Iconsax.home,
        ),
        title: "Home",
        activeColorPrimary: themeChange.darkTheme ? WHITE : PRIMARYCOLOR,
      ),
      PersistentBottomNavBarItem(
          activeColorPrimary: themeChange.darkTheme ? WHITE : PRIMARYCOLOR,
          icon: const Icon(Iconsax.note_2),
          title: "Records",
          textStyle: const TextStyle()),
      PersistentBottomNavBarItem(
        activeColorPrimary: themeChange.darkTheme ? WHITE : PRIMARYCOLOR,
        icon: const Icon(Iconsax.profile_circle),
        title: "Profile",
      ),
    ];

    return PersistentTabView(
      context,
      controller: PersistentTabController(initialIndex: 0),
      screens: _buildScreens(),
      items: _navBarItems,
      backgroundColor: themeChange.darkTheme ? PRIMARYCOLOR : WHITE,
      handleAndroidBackButtonPress: true,
      padding: const EdgeInsets.all(15),
      resizeToAvoidBottomInset: true,
      stateManagement: false,
      hideNavigationBarWhenKeyboardAppears: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(2.0),
      ),
      navBarHeight: 70,
      navBarStyle: NavBarStyle.style9,
    );
  }

  List<Widget> _buildScreens() {
    return [
      Homepage(),
      const RecordsPage(),
      const ProfilePage(),
    ];
  }
}
