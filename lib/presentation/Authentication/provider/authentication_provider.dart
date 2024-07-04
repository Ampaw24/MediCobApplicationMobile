import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  void showTextUnshow({required bool obsecureBool}) {
    obsecureBool = !obsecureBool;
    notifyListeners();
  }
}
