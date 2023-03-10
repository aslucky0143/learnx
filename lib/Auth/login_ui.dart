// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, avoid_print, must_be_immutable, prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/constants.dart';

class LoginUI extends StatefulWidget {
  var controller = PageController();
  LoginUI({
    super.key,
    required this.controller,
  });

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  Future signInwithEmail() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
        )
        .whenComplete(() => ScaffoldMessenger(child: Text("Loged In !!")));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 18,
              ),
              child: Text(
                "Sign in now🤘",
                style: GoogleFonts.heebo(
                    fontWeight: FontWeight.w700, fontSize: 42, color: c4),
              ),
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width - (18 * 3),
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: c4, width: 3),
                  ),
                  child: TextFormField(
                    cursorColor: c4,
                    style: TextStyle(color: c4),
                    controller: _email,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: c4,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width - (18 * 3),
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: c4, width: 3),
                  ),
                  child: TextFormField(
                    controller: _password,
                    style: TextStyle(color: c4),
                    cursorColor: c4,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: c4,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //Firebase COde For Google User Creaation
                    signInwithEmail();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width - (18 * 3),
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: c4, width: 3),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "SignIn",
                          style: TextStyle(
                            fontSize: 18,
                            color: c4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
