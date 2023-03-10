// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/Screens/components/language_info_head.dart';

class TextFetchFS extends StatefulWidget {
  const TextFetchFS({
    super.key,
    required this.collectionName,
  });
  final String collectionName;

  @override
  State<TextFetchFS> createState() => _TextFetchFSState();
}

class _TextFetchFSState extends State<TextFetchFS> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('language');
    return Flexible(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return FutureBuilder<DocumentSnapshot>(
                future: users.doc(widget.collectionName.toString()).get(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    if (snapshot.data!.data() != null) {
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      if (data['langName'] == widget.collectionName) {
                        return LanguageInfoHeadComponent(
                          imgURL: data['imgURL'],
                          langContext: data['langContext'],
                          langName: data['langName'],
                          
                          topics: data['topics'],
                        );
                      }
                    }
                  }
                  return Center(child: LinearProgressIndicator());
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
