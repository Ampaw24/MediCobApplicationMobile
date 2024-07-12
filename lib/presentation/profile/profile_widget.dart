// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class profilewidget extends StatelessWidget {
  final String userName;
  final String submessage;
  final Color color;
  String? imagepath;
  final bool isCircular;
  final bool isIcon;
  final VoidCallback? onTapsub;
  final Widget? icon;
  void Function()? tap;
  profilewidget({
    Key? key,
    this.isCircular = false,
    this.tap,
    this.icon,
    this.onTapsub,
    required this.userName,
    required this.submessage,
    required this.color,
    this.imagepath,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      onTap: tap,
      leading: Container(
        height: isIcon ? 30 : 55,
        width: isCircular ? 55 : 65,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  imagepath.toString(),
                ),
                fit: BoxFit.contain),
            color: color,
            shape: isCircular ? BoxShape.circle : BoxShape.rectangle),
        child: isIcon ? icon : Container(),
      ),
      title: Text(
        userName,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
      subtitle: GestureDetector(
        onTap: onTapsub,
        child: Text(
          submessage,
          style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 12,
              color: Color(0XFF1064E8).withOpacity(0.5)),
        ),
      ),
    );
  }
}

class profilewidgetIcon extends StatelessWidget {
  final String userName;
  final String submessage;
  final Color color;
  String? imagepath;
  final bool isCircular;
  final bool isIcon;
  final Widget? icon;
  void Function()? tap;
  profilewidgetIcon({
    Key? key,
    this.isCircular = false,
    this.tap,
    this.icon,
    required this.userName,
    required this.submessage,
    required this.color,
    this.imagepath,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      onTap: tap,
      leading: SizedBox(
          height: isIcon ? 30 : 55, width: isCircular ? 55 : 65, child: icon),
      title: Text(
        userName,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
      subtitle: Text(
        submessage,
        style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: Color(0XFF1064E8).withOpacity(0.5)),
      ),
    );
  }
}
