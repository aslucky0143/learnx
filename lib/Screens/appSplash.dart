// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import '/Screens/Auth/decision_tree.dart';
import '/Screens/Intro%20Screens/IS.dart';

import 'dart:async';

// Go to Page2 after 5s.
class AppSplash extends StatefulWidget {
  final showHome;
  const AppSplash({super.key, required this.showHome});

  @override
  State<AppSplash> createState() => _AppSplashState();
}

class _AppSplashState extends State<AppSplash> {
  var selected = false;
  Future _state() async {
    await Duration(seconds: 5);
    setState(() {
      selected = !selected;
    });
  }

  nextPage() async {
    Timer(Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              widget.showHome ? IntroScreens() : DecisionTreeforSignInUp(),
        ),
      );
    });
  }

  @override
  void initState() {
    _state();
    nextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double scHeight = MediaQuery.of(context).size.height;
    double scWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black,
          height: scHeight,
          width: scWidth,
          child:
              Image.asset("assets/images/applogo.png", height: 200, width: 200),
        ),
      ),
    );
  }
}
