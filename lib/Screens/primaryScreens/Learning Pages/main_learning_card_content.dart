// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, avoid_print

import 'package:flutter/material.dart';
import '/Firebase%20Functions/DataFetch/text_fetch.dart';

class LanguageInfoPage extends StatefulWidget {
  const LanguageInfoPage({super.key, required this.collectionName});
  final String collectionName;
  @override
  State<LanguageInfoPage> createState() => _LanguageInfoPageState();
}

class _LanguageInfoPageState extends State<LanguageInfoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(19, 16, 0, 16),
          child: Column(
            children: [
              TextFetchFS(
                collectionName: widget.collectionName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
