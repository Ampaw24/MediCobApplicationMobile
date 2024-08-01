import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newmedicob/core/app_export.dart';
import 'package:newmedicob/core/button.dart';
import 'package:newmedicob/core/colors.dart';
import 'package:newmedicob/core/image_constant.dart';
import 'package:newmedicob/presentation/profile/provider/darktheme_provider.dart';
import 'package:newmedicob/presentation/vital%20Check/BMI/main_screen.dart';
import 'package:newmedicob/presentation/vital%20Check/PPG/pp_original.dart';
import 'package:newmedicob/presentation/vital%20Check/temperature_check/provider/vital_check_provider.dart';
import 'package:newmedicob/presentation/vital%20Check/temperature_check/temperature_page.dart';
import 'package:newmedicob/presentation/vital%20Check/widget/infor_card_widget.dart';

class VitalSignsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(
        backgroundColor: themeChange.darkTheme ? PRIMARYCOLOR : Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Iconsax.close_circle)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            Consumer<VitalCheckProvider>(builder: (context, provider, child) {
          return Column(
            children: [
              Center(
                child: Image.asset(
                  ImageConstant.logo,
                  height: 100,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Vital Signs',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Vital signs Monitoring',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InfoCard(
                    pageWidget: BMIChecker(),
                    title: 'BMI',
                    value: '${provider.bmi_value}',
                    icon: Icons.calculate,
                  ),
                  InfoCard(
                    pageWidget: TemperatureConversionPage(),
                    title: 'Temp',
                    value: '${provider.temperature_value}°C',
                    icon: Iconsax.cloud,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: InfoCard(
                  pageWidget: PPOriginalPage(),
                  title: 'PPG',
                  value: '${provider.ppg_value} bps',
                  icon: Icons.favorite,
                  fullWidth: true,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: button(
                    height: 60,
                    useGradient: true,
                    onPressed: () {},
                    text: "Track",
                    textStyle: TextStyle(fontWeight: FontWeight.w600),
                    color: Colors.transparent,
                    context: context),
              )
            ],
          );
        }),
      ),
    );
  }
}
