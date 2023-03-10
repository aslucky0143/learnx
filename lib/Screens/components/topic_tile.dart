// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '/constants.dart';

class TopicTile extends StatelessWidget {
  const TopicTile({
    super.key,
    required String title,
    required String context,
  })  : _title = title,
        _context = context;

  final String _title;
  final String _context;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      padding: EdgeInsets.only(bottom: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _title,
                style: TextStyle(fontSize: 18),
              ),
              FittedBox(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Text(
                    _context,
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios_outlined),
        ],
      ),
    );
  }
}
