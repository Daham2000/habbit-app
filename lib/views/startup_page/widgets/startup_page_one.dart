import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'slider_dots_widget.dart';

class StartupPageOne extends StatefulWidget {
  const StartupPageOne({super.key});

  @override
  State<StartupPageOne> createState() => _StartupPageOneState();
}

class _StartupPageOneState extends State<StartupPageOne> {
  final PageController _pageController = PageController(viewportFraction: 1);

  int _currentPage = 0;
  final List<String> images = [
    'assets/images/startup_img.png',
    'assets/images/startup_page_two.png',
    'assets/images/startup_page_three.png',
  ];
  final List<String> titles = [
    'Create Good\nHabits',
    'Track Your\nProgress',
    'Stay Together\nand Strong',
  ];
  final List<String> descriptions = [
    'Change your life by slowly adding new healty habits and sticking to them.',
    'Everyday you become one step closer to your goal. Don’t give up!',
    'Find friends to discuss common topics. Complete challenges together.',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.height;
    double imageSizeHeight = screenWidth * 0.45; // 10% of screen width
    double sliderHeight = screenWidth * 0.69; // 10% of screen width
    return Column(
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
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                child: Column(
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
                          titles[index],
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
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
                        descriptions[index],
                        style: const TextStyle(
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
                ),
              );
            },
          ),
        ),
        SliderDotsWidget(currentPage: _currentPage,)
      ],
    );
  }
}
