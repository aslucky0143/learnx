// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, avoid_print
import 'package:flutter/material.dart';
import '/Screens/Intro%20Screens/ISLast.dart';
import '/Screens/Intro%20Screens/IS1.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({super.key});

  @override
  State<IntroScreens> createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          IntroScreens2(
            imgName: "dark-office",
            heading: "Master the Art Of Coding",
            subHeading:
                "Learn the fundamentals and advanced concepts of coding",
          ),
          IntroScreens2(
            imgName: "pexels-xxss-is-back-777001",
            heading: "Unleash The Full Coding Potential",
            subHeading: "Release the Wild Coder in You",
          ),
          IntroScreenslast()
        ],
      ),
    );
  }
}
