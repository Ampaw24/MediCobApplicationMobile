import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newmedicob/core/button.dart';
import 'package:newmedicob/core/image_constant.dart';

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

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final bool fullWidth;

  const InfoCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    this.fullWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Colors.blue.withOpacity(0.2),
      child: Container(
        width: fullWidth ? double.infinity : 150,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              fullWidth ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            AutoSizeText(
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
                Icon(icon),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
