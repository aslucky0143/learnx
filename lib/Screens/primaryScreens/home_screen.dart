// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/Screens/components/card_learning_card.dart';
import '/Screens/components/profile_bar.dart';
import '/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.user,
    required this.left,
    required this.controller,

  });
final PageController controller;
  final User user;
  final double left;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileBar(user: user),
        SizedBox(
          height: 24,
        ),
        SizedBox(
          child: FittedBox(
            child: Text(
              user.displayName!,
              style: GoogleFonts.ptSerif(
                color: dashCard,
                fontSize: 42,
              ),
            ),
          ),
        ),
        SizedBox(
          child: FittedBox(
            child: Text(
              user.email!,
              style: GoogleFonts.ptSerif(
                color: dashCardsubHead,
                fontSize: 18,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 70,
        ),
        DashBoardNavigationCard(left: left,controller: controller,)
      ],
    );
  }
}
