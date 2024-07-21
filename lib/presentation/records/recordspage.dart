import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/colors.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class RecordsPage extends StatefulWidget {
  const RecordsPage({super.key});

  @override
  State<RecordsPage> createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "History",
          style: GoogleFonts.poppins(
              color: PRIMARYLIGHT, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: const  [
            TitleBanner(),
            Gap(10),

        ],
      ),
    );
  }
}

class TitleBanner extends StatelessWidget {
  const TitleBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      decoration: BoxDecoration(
          color: WHITE, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          const Gap(25),
          const Card(
            color: Color(0xff4794CE),
            child: SizedBox(
              width: 35,
              height: 35,
              child: Icon(
                size: 30,
                Iconsax.book_square4,
                color: Colors.white,
              ),
            ),
          ),
          const Gap(15),
          Container(
            padding: const EdgeInsets.only(left: 20),
            width: MediaQuery.of(context).size.width * 0.6,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(10),
                Text(
                  "Track History",
                  style: GoogleFonts.poppins(
                      color: PRIMARYCOLOR,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                const Gap(5),
                Text(
                  "Available Checkup Records",
                  style: GoogleFonts.poppins(
                      color: const Color(0xff4794CE),
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 30,
            child: Text("30",
                style: GoogleFonts.poppins(
                    color: Colors.black.withOpacity(0.40),
                    fontWeight: FontWeight.w700,
                    fontSize: 26)),
          ),
        ],
      ),
    );
  }
}
