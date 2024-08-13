import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../login_page/login_page_view.dart';

class BottomSocialView extends StatefulWidget {
  const BottomSocialView({super.key});

  @override
  State<BottomSocialView> createState() => _BottomSocialViewState();
}

class _BottomSocialViewState extends State<BottomSocialView> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPadding = screenWidth * 0.025; // 10% of screen width
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 5, right: 5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPageView()),
                      )
                    },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_right_alt_sharp),
                    Text(
                      "Continue with E-mail",
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ElevatedButton(
                    onPressed: () => {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.apple),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Apple",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: 8.0), // Custom padding
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ElevatedButton(
                    onPressed: () => {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Google",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: 8.0), // Custom padding
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ElevatedButton(
                    onPressed: () => {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Facebook",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: 8.0), // Custom padding
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              "By continuing you agree Terms of Services & Privacy Policy.",
              style: GoogleFonts.roboto(
                  decoration: TextDecoration.none,
                  fontSize: 10.0,
                  color: Color(0xFFEAECF0)),
            ),
          )
        ],
      ),
    );
  }
}
