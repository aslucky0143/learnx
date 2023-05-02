// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:learnx/Firebase%20Functions/DataFetch/text_fetch_details.dart';
import 'package:learnx/Screens/components/docViewCard.dart';
import 'package:learnx/constants.dart';

class DocView extends StatefulWidget {
  const DocView({super.key, required this.collectionName});
  final String collectionName;

  @override
  State<DocView> createState() => _DocViewState();
}

class _DocViewState extends State<DocView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: TextFetchDatails(collectionName: widget.collectionName),
        ),
      ),
    );
  }
}
