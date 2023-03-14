// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, avoid_print, must_be_immutable, prefer_typing_uninitialized_variables
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/Screens/primaryScreens/desicision_home.dart';
import '/Screens/Auth/AuthPage.dart';

class DecisionTreeforSignInUp extends StatelessWidget {
  var curentUser;
  DecisionTreeforSignInUp({
    super.key,
    this.curentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.active) {
            
            return DecisionHomeScreen();
          } else if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return ErrorWidget(snapshot);
          } else if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasData) {
            return ErrorWidget("No Data Available");
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
