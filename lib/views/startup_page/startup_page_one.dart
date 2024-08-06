import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartupPageOne extends StatefulWidget {
  const StartupPageOne({super.key});

  @override
  State<StartupPageOne> createState() => _StartupPageOneState();
}

class _StartupPageOneState extends State<StartupPageOne> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  int _currentPage = 0;
  final List<String> images = [
    'assets/images/startup_img.png',
    'assets/images/startup_page_two.png',
    'assets/images/startup_page_three.png',
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.height;
    double imageSizeHeight = screenWidth * 0.45; // 10% of screen width
    double sliderHeight = screenWidth * 0.70; // 10% of screen width
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: sliderHeight, // Define the height of the carousel
            child: PageView.builder(
              controller: _pageController,
              itemCount: images.length, // Number of items in your carousel
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Image.asset(
                        images[index],
                        height: imageSizeHeight,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Create\nGood Habits",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.none,
                                fontSize: 40.0,
                              )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "Change your life by slowly adding new healty habits and sticking to them.",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                // light
                          fontStyle: FontStyle.normal,
                          decoration: TextDecoration.none,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
