import 'package:flutter/material.dart';

import '../../pref_utils.dart';


class ThemeProvider extends ChangeNotifier {
  themeChange(String themeType) async {
    PrefUtils().setThemeData(themeType);
    notifyListeners();
  }
}
