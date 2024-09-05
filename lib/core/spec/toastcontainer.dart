import 'package:flutter/material.dart';
import 'package:get/get.dart';

void toastContainer({
  required BuildContext context,
  required String msg,
  required Color color,
}) {
  Get.showSnackbar(GetSnackBar(
    message: msg,
    backgroundColor: color,
  ));
  // showToast(
  //   msg,
  //   context: context,
  //   animation: StyledToastAnimation.scale,
  //   reverseAnimation: StyledToastAnimation.fade,
  //   position: StyledToastPosition.center,
  //   animDuration: Duration(seconds: 1),
  //   duration: Duration(seconds: 4),
  //   curve: Curves.elasticOut,
  //   reverseCurve: Curves.linear,
  //   backgroundColor: color,
  // );
}
