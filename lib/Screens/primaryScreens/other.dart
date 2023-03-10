// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, avoid_print
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/constants.dart';

class Others extends StatefulWidget {
  const Others({super.key});

  @override
  State<Others> createState() => _OthersState();
}

class _OthersState extends State<Others> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome to Learn X",
                style: GoogleFonts.ptSerif(color: c4, fontSize: 46),
              ),
              Text(
                "- Shortest Way to Learn Code",
                style:
                    GoogleFonts.ptSerif(color: dashCardsubHead, fontSize: 23),
              ),
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "App Version: 1.0.0",
                style:
                    GoogleFonts.ptSerif(color: dashCardsubHead, fontSize: 23),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
