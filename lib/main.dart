// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/Firebase%20Functions/Auth/auth_functions.dart';
import '/Screens/appSplash.dart';
import 'dart:io' show Platform;
import '/constants.dart'; 
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final pref = await SharedPreferences.getInstance();
  final iSstate = pref.getBool('ISAvail') ?? true;
  runApp(MyApp(howHome: iSstate));
}

class MyApp extends StatelessWidget {
  final bool howHome;
  const MyApp({super.key, required this.howHome});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ));
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        title: 'Learn X',
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: Platform.isAndroid
            ? AppSplash(
                showHome: howHome,
              )
            : Scaffold(body: PlatformErrorMsg()),
      ),
    );
  }
}

class IOS extends StatelessWidget {
  const IOS({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlatformErrorMsg(),
    );
  }
}

class PlatformErrorMsg extends StatelessWidget {
  const PlatformErrorMsg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            c1,
            c3,
            c2,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Center(
        child: Text("Under Development!!!#Platform:${Platform.operatingSystem}",
            style: TextStyle(color: c4, fontSize: 46)),
      ),
    );
  }
}

class Windows extends StatelessWidget {
  const Windows({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PlatformErrorMsg());
  }
}
