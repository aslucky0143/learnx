// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, avoid_print, must_be_immutable
// ignore: unused_import
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/Firebase%20Functions/Auth/auth_functions.dart';
import '/constants.dart';

class SignUpUI extends StatelessWidget {
  var controller = PageController();
  SignUpUI({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 18,
          ),
          child: Text(
            "Join the coding revolution⚒\nSign up today🥇",
            style: GoogleFonts.heebo(
                fontWeight: FontWeight.w700, fontSize: 42, color: c4),
          ),
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                //Firebase COde For Google User Creaation
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width - (18 * 3),
                margin: EdgeInsets.all(18),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: c4, width: 3),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: c4,
                      child: Image.asset("assets/images/Icons/google.png",
                          height: 30, width: 30),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "SignUp With Google",
                      style: TextStyle(
                        fontSize: 18,
                        color: c4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (controller.hasClients) {
                  controller.animateToPage(2,
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOut);
                }
              },
              child: Text(
                "Already Registered? Click Here👆",
                style: TextStyle(color: c3),
              ),
            )
          ],
        ),
      ],
    );
  }
}
