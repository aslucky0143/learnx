// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, avoid_print
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '/Screens/primaryScreens/desicision_home.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    super.key,
  });

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  nextPage() async {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => DecisionHomeScreen(),
        ),
      );
    });
  }

  @override
  void initState() {
    nextPage();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xffff0000),
            Color(0xffffa500),
            Color(0xffffff00),
            Color(0xff008000),
            Color(0xff0000ff),
            Color(0xff4b0082),
            Color(0xffee82ee),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Center(
          child: Lottie.asset(
            "assets/json/welcome-apple-style.json",
            repeat: true,
          ),
        ),
      ),
    );
  }
}
