// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, avoid_print

import 'package:flutter/material.dart';
import '/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoardNavigationCard extends StatelessWidget {
  const DashBoardNavigationCard(
      {super.key, required this.left, required this.controller});
  final PageController controller;
  final double left;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.hasClients) {
          controller.nextPage(
            curve: Curves.ease,
            duration: Duration(seconds: 1),
          );
        }
      },
      child: Container(
        alignment: Alignment.topLeft,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            18,
          ),
          border: Border.all(color: c4, width: .15),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurStyle: BlurStyle.outer,
              blurRadius: 12.0,
            ),
          ],
          color: dashCard,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Start Learning New Tech",
                    style: GoogleFonts.ptSerif(
                      color: c4,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Mike and Aita",
                    style: GoogleFonts.ptSerif(
                      color: dashCardsubHead,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(
                          "assets/images/Icons/html.png",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: left),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                            "assets/images/Icons/CSS.png",
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: (left * 2)),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                            "assets/images/Icons/js.png",
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: (left * 3)),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                            "assets/images/Icons/node js.png",
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: (left * 4)),
                        child: CircleAvatar(
                          backgroundColor: c4,
                          child: Text("...."),
                        ),
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Next",
                            style: TextStyle(color: dashCardsubHead),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: dashCardsubHead,
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
