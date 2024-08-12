import 'package:flutter/material.dart';
import 'package:habbit_tracker/views/startup_page/widgets/BottomSocialView.dart';

import 'widgets/startup_page_one.dart';

class StartUpView extends StatefulWidget {
  const StartUpView({super.key});

  @override
  State<StartUpView> createState() => _StartUpViewState();
}

class _StartUpViewState extends State<StartUpView> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6B73FF), // Hex color #6B73FF
              Color(0xFF000DFF), // Hex color #000DFF
            ],
          ),
        ),
        child: const Center(
          child: Column(
            children: [
              Column(
                children: [
                  StartupPageOne(),
                  //Bottom social link buttons list
                  BottomSocialView()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
