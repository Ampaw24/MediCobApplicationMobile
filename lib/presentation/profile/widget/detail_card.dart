import 'package:flutter/material.dart';
import 'package:newmedicob/core/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailProfileCard extends StatefulWidget {
  final String weighValue;
  final String weighDescription;
  const DetailProfileCard({
    super.key,
    required this.weighValue,
    required this.weighDescription,
  });

  @override
  State<DetailProfileCard> createState() => _DetailProfileCardState();
}

class _DetailProfileCardState extends State<DetailProfileCard> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
          color: PRIMARYLIGHT.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.weighValue,
            style: GoogleFonts.poppins(
                color: WHITE, fontSize: 13, fontWeight: FontWeight.w500),
          ),
          Text(
            widget.weighDescription,
            style: GoogleFonts.poppins(
                color: Colors.blue, fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
