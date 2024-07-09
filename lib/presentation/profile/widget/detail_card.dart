import 'package:flutter/material.dart';
import 'package:newmedicob/core/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class DetailProfileCard extends StatelessWidget {
  final String weighValue;
  final String weighDescription;
  const DetailProfileCard({
    super.key,
    required this.weighValue,
    required this.weighDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 80,
      decoration: BoxDecoration(
          color: PRIMARYLIGHT.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
         const Gap(5),
          Text(
            weighValue,
            style: GoogleFonts.poppins(
                color: PRIMARYCOLOR, fontSize: 15, fontWeight: FontWeight.w700),
          ),
          Text(
           weighDescription,
            style: GoogleFonts.poppins(
                color: Colors.blue, fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
