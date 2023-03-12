import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/Firebase%20Functions/Auth/auth_functions.dart';
import '/constants.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({
    super.key,
    required this.user,
    required this.controller,
  });

  final User user;
  final controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/images/applogo.png",
          height: 50,
          width: 50,
        ),
        GestureDetector(
          onTap: () {
            if (controller.hasClients) {
              controller.animateToPage(
                2,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            }
          },
          child: CircleAvatar(
            radius: 20,
            child: CircleAvatar(
              radius: 19.3,
              backgroundColor: c4,
              backgroundImage: NetworkImage(
                user.photoURL!,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
