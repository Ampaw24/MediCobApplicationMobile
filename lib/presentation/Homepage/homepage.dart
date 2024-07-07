import 'package:flutter/material.dart';
import 'package:newmedicob/core/colors.dart';
import 'package:newmedicob/core/image_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:newmedicob/core/textstyles.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          splashColor: PRIMARYLIGHT.withOpacity(0.3),
          elevation: 4,
          backgroundColor: WHITE,
          onPressed: () {},
          child: Image.asset(
            ImageConstant.robotLogo,
            fit: BoxFit.cover,
          )),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Hi, Safo\nMay you always be healthy',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBMISection(),
              const SizedBox(height: 16),
              _buildRecommendationTopics(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBMISection() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageConstant.bannerBackground),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(30),
              Text('BMI (Body Mass Index)',
                  style: GoogleFonts.poppins(
                      fontSize: 13, fontWeight: FontWeight.bold, color: WHITE)),
              Text('You have a normal weight', style: bannerTextWhite2),
              Container(
                margin: const EdgeInsets.only(top: 20, right: 15),
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                    gradient: DEEPBUTTONGRADIENT,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    "Check More",
                    style: bannerTextWhite2,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildRecommendationTopics() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recommendation Topics',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('View all'),
            ),
          ],
        ),
        _buildRecommendationItem(
          title: 'How to burn calories effectively',
          author: 'Dr. Edward Quainoio',
          daysAgo: 4,
          imageUrl: 'https://via.placeholder.com/100',
        ),
        _buildRecommendationItem(
          title: '6 Ways to have the best shape',
          author: 'Dr. Qhobbie Junior',
          daysAgo: 4,
          imageUrl: 'https://via.placeholder.com/100',
        ),
        _buildRecommendationItem(
          title: 'How to burn calories effectively',
          author: 'Dr. Edward Quainoio',
          daysAgo: 4,
          imageUrl: 'https://via.placeholder.com/100',
        ),
      ],
    );
  }

  Widget _buildRecommendationItem({
    required String title,
    required String author,
    required int daysAgo,
    required String imageUrl,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.network(
            imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'by $author • $daysAgo days ago',
                  style: TextStyle(color: Colors.grey),
                ),
                const Text(
                  'Lorem ipsum dolor sit amet consectetur. Adipiscing sed lectus dolor congue.',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
