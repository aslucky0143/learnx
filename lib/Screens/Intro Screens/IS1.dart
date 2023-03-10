// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, avoid_print
import 'package:flutter/material.dart';
import '/constants.dart';

class IntroScreens2 extends StatelessWidget {
  final String imgName;
  final String heading;
  final String subHeading;
  const IntroScreens2(
      {super.key,
      required this.imgName,
      required this.heading,
      required this.subHeading});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/$imgName.jpg",
            ),
          ),
        ),
        padding: EdgeInsets.only(top: 120),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width - 48,
                  padding: EdgeInsets.only(top: 18, bottom: 18),
                  child: FittedBox(
                    child: Text(
                      heading,
                      style: TextStyle(
                        fontSize: 36,
                        color: c4,
                      ),
                    ),
                  ),
                ),
                FittedBox(
                  child: Text(
                    subHeading,
                    style: TextStyle(
                      fontSize: 18,
                      color: subColor,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(18),
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Swipe",
                    style: TextStyle(
                      color: c4,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: c4,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
