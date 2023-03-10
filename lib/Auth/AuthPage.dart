// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, avoid_print, must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/Auth/login_ui.dart';
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
            AuthPageContent(controller: _controller),
            LoginUI(controller: _controller),
          ],
        ),
      ),
    );
  }
}

class AuthPageContent extends StatelessWidget {
  var controller = PageController();
  AuthPageContent({
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
            "Unlock endless possibilities with a\nsimple login💻",
            style: GoogleFonts.heebo(
                fontWeight: FontWeight.w700, fontSize: 46, color: c4),
          ),
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                if (controller.hasClients) {
                  controller.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width - (18 * 3),
                margin: EdgeInsets.all(18),
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [btnGr1, gr4],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: c4, width: 3),
                    color: c3),
                child: Text(
                  "SignIn",
                  style: TextStyle(fontSize: 18, color: c4),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
