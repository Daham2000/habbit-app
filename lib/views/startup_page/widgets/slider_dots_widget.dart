import 'package:flutter/material.dart';

class SliderDotsWidget extends StatelessWidget {
  final currentPage;
  const SliderDotsWidget({super.key, this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                (currentPage == 0) ? "assets/images/active_icon.png" : "assets/images/deactive_icon.png",
                height: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                (currentPage == 1) ? "assets/images/active_icon.png" : "assets/images/deactive_icon.png",
                height: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                (currentPage == 2) ? "assets/images/active_icon.png" : "assets/images/deactive_icon.png",
                height: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
