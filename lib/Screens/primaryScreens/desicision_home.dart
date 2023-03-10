// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';
import '/Screens/primaryScreens/home_screen.dart';
import '/Screens/primaryScreens/learning_home.dart';
import '/Screens/primaryScreens/other.dart';
import '/constants.dart';

class DecisionHomeScreen extends StatefulWidget {
  const DecisionHomeScreen({super.key});

  @override
  State<DecisionHomeScreen> createState() => _DecisionHomeScreenState();
}

class _DecisionHomeScreenState extends State<DecisionHomeScreen> {
  int index = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: black,
      statusBarColor: black,
    ));
    double left = 28.0;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(18),
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                children: [
                  HomeScreen(user: user, left: left, controller: controller),
                  LearningHome(),
                  Others(),
                ],
              )),
        ),
        bottomNavigationBar: customBottomNav(),
      ),
    );
  }

  BottomNavigationBar customBottomNav() {
    return BottomNavigationBar(
      onTap: (value) => setState(() {
        if (controller.hasClients) {
          controller.animateToPage(value,
              duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
        }
      }),
      currentIndex: index,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 32,
      useLegacyColorScheme: true,
      items: [
        BottomNavigationBarItem(
          activeIcon: Icon(
            Bootstrap.house_heart_fill,
            color: dashSubHead,
          ),
          icon: Icon(
            Bootstrap.house_heart,
            color: dashSubHead,
          ),
          label: "Home",
          tooltip: "Home",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Bootstrap.book_fill,
            color: dashSubHead,
          ),
          icon: Icon(
            Bootstrap.book,
            color: dashSubHead,
          ),
          label: "Home",
          tooltip: "Home",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Bootstrap.three_dots,
            color: dashSubHead,
          ),
          icon: Icon(
            Bootstrap.three_dots_vertical,
            color: dashSubHead,
          ),
          label: "Home",
          tooltip: "Home",
        )
      ],
    );
  }
}
