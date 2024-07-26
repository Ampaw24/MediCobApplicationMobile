import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newmedicob/core/button.dart';
import 'package:newmedicob/core/image_constant.dart';
import 'package:newmedicob/presentation/vital%20Check/widget/infor_card_widget.dart';

class VitalSignsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
              children: const [
                InfoCard(
                  title: 'BMI',
                  value: '30',
                  icon: Icons.calculate,
                ),
                InfoCard(
                  title: 'Temp',
                  value: '30°C',
                  icon: Iconsax.cloud,
                ),
              ],
            ),
            SizedBox(height: 20),
            InfoCard(
              title: 'PPG',
              value: '30 bps',
              icon: Icons.favorite,
              fullWidth: true,
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
        ),
      ),
    );
  }
}

