import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'colors.dart';
import 'textstyles.dart';

Widget button({
  @required void Function()? onPressed,
  void Function()? onLongPressed,
  @required String? text,
  @required Color? color,
  Color textColor = Colors.white,
  bool colorFill = true,
  @required BuildContext? context,
  double divideWidth = 1.0,
  bool useWidth = true,
  double buttonRadius = 5,
  double height = 40,
  double elevation = .0,
  Color backgroundcolor = Colors.white,
  bool showLoadingIndicator = false,
  TextStyle? textStyle,
  Widget? leadingIcon,
  bool showBorder = true,
  EdgeInsetsGeometry? padding,
  bool centerItems = false,
  bool useGradient = false,
  BorderRadiusGeometry? borderRadiusGeometry,
  Widget? postFixIcon,
  ButtonStyle? style,
  Widget? icon,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(buttonRadius),
      gradient: useGradient ? BUTTONGRADIENT : null,
    ),
    width: useWidth ? MediaQuery.of(context!).size.width * divideWidth : null,
    height: height,
    child: ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPressed,
      style: ElevatedButton.styleFrom(
        padding: padding,
        elevation: elevation,
        foregroundColor: textColor,
        backgroundColor: colorFill ? color : backgroundcolor,
        enableFeedback: false,
        shape: RoundedRectangleBorder(
          side: showBorder ? BorderSide(color: color!) : BorderSide.none,
          borderRadius:
              borderRadiusGeometry ?? BorderRadius.circular(buttonRadius),
        ),
        textStyle: textStyle ?? h4Black,
      ),
      child: showLoadingIndicator
          ? const SpinKitChasingDots(
              color: Colors.white,
              size: 30.0,
            )
          : leadingIcon == null && postFixIcon == null
              ? Text("$text", textAlign: TextAlign.center)
              : Row(
                  mainAxisAlignment: centerItems
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    if (leadingIcon != null) leadingIcon,
                    const SizedBox(width: 10),
                    Text("$text"),
                    if (postFixIcon != null) postFixIcon,
                  ],
                ),
    ),
  );
}
