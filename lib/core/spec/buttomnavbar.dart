import 'package:flutter/material.dart';
import 'package:newmedicob/core/colors.dart';
import 'package:newmedicob/presentation/Homepage/homepage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:iconsax/iconsax.dart';

import '../../presentation/profile/profile_page.dart';
import '../../presentation/records/recordspage.dart';

class BTNAV extends StatelessWidget {
  const BTNAV({Key? key});

  @override
  Widget build(BuildContext context) {
    List<PersistentBottomNavBarItem> _navBarItems = [
      PersistentBottomNavBarItem(
        icon: const Icon(
          Iconsax.home,
        ),
        title: "Home",
        activeColorPrimary: PRIMARYLIGHT,
      ),
      PersistentBottomNavBarItem(
          activeColorPrimary: PRIMARYLIGHT,
          icon: const Icon(Iconsax.note_2),
          title: "Records",
          textStyle: const TextStyle()),
      PersistentBottomNavBarItem(
        activeColorPrimary: PRIMARYLIGHT,
        icon: const Icon(Iconsax.profile_circle),
        title: "Profile",
      ),
    ];

    return PersistentTabView(
      context,
      controller: PersistentTabController(initialIndex: 0),
      screens: _buildScreens(),
      items: _navBarItems,
      confineInSafeArea: false,
      backgroundColor: WHITE,
      handleAndroidBackButtonPress: true,
      padding: const NavBarPadding.all(15),
      resizeToAvoidBottomInset: true,
      stateManagement: false,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(2.0),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 50),
        curve: Curves.easeOutBack,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.linear,
        duration: Duration(milliseconds: 100),
      ),
      navBarHeight: 70,
      navBarStyle: NavBarStyle.style9,
    );
  }

  List<Widget> _buildScreens() {
    return [
      Homepage(),
      const ProfilePage(),
      const RecordsPage(),
    ];
  }
}
