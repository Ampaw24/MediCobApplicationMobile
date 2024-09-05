import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newmedicob/core/app_export.dart';
import 'package:newmedicob/core/colors.dart';
import 'package:newmedicob/presentation/profile/provider/darktheme_provider.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final bool fullWidth;
  final Widget pageWidget;
  const InfoCard({
    Key? key,
    required this.pageWidget,
    required this.title,
    required this.value,
    required this.icon,
    this.fullWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return GestureDetector(
      onTap: () => Get.to(() => pageWidget, transition: Transition.cupertino),
      child: Card(
        elevation: 8,
        shadowColor: Colors.blue.withOpacity(0.2),
        child: Container(
          width: fullWidth ? double.infinity : 150,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
              color: themeChange.darkTheme ? PRIMARYCOLOR : WHITE,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: fullWidth
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              AutoSizeText(
                maxFontSize: 18,
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    value,
                    style: TextStyle(fontSize: 24),
                  ),
                  Icon(
                    icon,
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
