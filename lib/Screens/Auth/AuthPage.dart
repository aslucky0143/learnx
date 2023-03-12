// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, avoid_print, must_be_immutable
import 'package:flutter/material.dart';
import '/Screens/Auth/login_ui.dart';
import '/constants.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  int index = 0;
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [gr3, gr4])),
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller,
          scrollDirection: Axis.vertical,
          children: [
            LoginUI(controller: _controller),
          ],
        ),
      ),
    );
  }
}
