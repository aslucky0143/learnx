// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, avoid_print
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '/constants.dart';

import '../../Firebase Functions/DataFetch/learnings_text_fetch.dart';

class LearningHome extends StatefulWidget {
  const LearningHome({super.key});

  @override
  State<LearningHome> createState() => _LearningHomeState();
}

class _LearningHomeState extends State<LearningHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          SalutationLearnings(salutation: "What do u want to learn now?"),
          CollectionTextFetchFS()
        ],
      ),
    );
  }
}

class SalutationLearnings extends StatelessWidget {
  const SalutationLearnings({
    super.key,
    required this.salutation,
  });

  final String salutation;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width - 48,
            padding: EdgeInsets.only(top: 18, bottom: 18),
            child: FittedBox(
              child: Text(
                salutation,
                style: TextStyle(
                  fontSize: 36,
                  color: dashCard,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Lottie.asset(
              "assets/json/Coffee-Anim.json",
              repeat: true,
              options: LottieOptions(
                enableMergePaths: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
