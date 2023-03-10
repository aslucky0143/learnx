// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore

import 'package:flutter/material.dart';
import '/Screens/components/topic_head_tile.dart';
import '/Screens/components/topic_tile.dart';
import '/constants.dart';

class LanguageInfoHeadComponent extends StatelessWidget {
  const LanguageInfoHeadComponent({
    super.key,
    required String langName,
    required String langContext,
    required String imgURL,
    required Map<String, dynamic> topics,
  })  : _langName = langName,
        _langContext = langContext,
        _imgURL = imgURL,
        _topics = topics;

  final String _langName;
  final String _langContext;
  final String _imgURL;
  final Map<String, dynamic> _topics;

  @override
  Widget build(BuildContext context) {
    List topicTitle = _topics.keys.toList();
    List topicContext = _topics.values.toList();
    double height = 18;

    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopicTitleHead(
            langName: _langName,
            langContext: _langContext,
            height: height,
            imgURL: _imgURL,
          ),
          Padding(
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: Text("Topics Available:", style: TextStyle(fontSize: 24)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _topics.keys.length,
              itemBuilder: (context, index) {
                return TopicTile(
                  title: topicTitle[index],
                  context: topicContext[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Visibility noDataAvailable() {
    return Visibility(
      visible: _topics.isEmpty,
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Align(
            alignment: Alignment.center,
            child: Center(
              child: Text("No data"),
            ),
          ),
        ],
      ),
    );
  }
}
