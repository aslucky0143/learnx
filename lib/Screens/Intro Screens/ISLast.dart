// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, avoid_print, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/Screens/Auth/decision_tree.dart';

import '/constants.dart';

class IntroScreenslast extends StatelessWidget {
  const IntroScreenslast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/coffee.jpg",
            ),
          ),
        ),
        padding: EdgeInsets.only(top: 120),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width - 48,
                  padding: EdgeInsets.only(top: 18, bottom: 18),
                  child: FittedBox(
                    child: Text(
                      "Discover the power of Coding",
                      style: TextStyle(
                        fontSize: 36,
                        color: c4,
                      ),
                    ),
                  ),
                ),
                FittedBox(
                  child: Text(
                    "Let's get started with a strong Coffee",
                    style: TextStyle(
                      fontSize: 16,
                      color: subColor,
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () async {
                final pref = await SharedPreferences.getInstance();
                pref.setBool('ISAvail', false).then((value) => print(value));
                print("object");
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => DecisionTreeforSignInUp(),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.all(18),
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: c4,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Let's get started ", style: TextStyle()),
                    Icon(
                      Icons.arrow_forward_ios,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
