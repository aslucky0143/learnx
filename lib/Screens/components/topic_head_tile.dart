// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '/constants.dart';

class TopicTitleHead extends StatelessWidget {
  const TopicTitleHead({
    super.key,
    required String langName,
    required String langContext,
    required this.height,
    required String imgURL,
  })  : _langName = langName,
        _langContext = langContext,
        _imgURL = imgURL;

  final String _langName; //name of the language
  final String _langContext; //Context of the language
  final double height;
  final String _imgURL; //link of the language image

  @override
  Widget build(BuildContext context) {
    double sch = MediaQuery.of(context).size.height;
    double scw = MediaQuery.of(context).size.width - 37;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: SizedBox(
            width: scw * .7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _langName,
                  style: TextStyle(
                    fontSize: 36,
                  ),
                ),
                FittedBox(
                  child: SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width - 16,
                    child: Text(
                      _langContext,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      maxLines: 4,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Image.network(
          _imgURL,
          width: scw * .3,
        )
      ],
    );
  }
}
