// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learnx/Screens/components/docViewCard.dart';
import '/Screens/components/language_info_head.dart';

class TextFetchDatails extends StatefulWidget {
  TextFetchDatails({
    super.key,
    required this.collectionName,
  });
  String collectionName;

  @override
  State<TextFetchDatails> createState() => _TextFetchDatailsState();
}

class _TextFetchDatailsState extends State<TextFetchDatails> {
  List<String> docId = [];
  Future getDocIDs() async {
    await FirebaseFirestore.instance
        .collection(widget.collectionName)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              docId.add(document.reference.id);
            },
          ),
        );
    docId = docId.toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection(widget.collectionName);
    return FutureBuilder(
      future: getDocIDs(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (docId.length == 0) {
          return Text("No data available");
        }
        return Container(
          margin: EdgeInsets.only(bottom: 100),
          child: ListView.builder(
            itemCount: docId.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: FutureBuilder<DocumentSnapshot>(
                  future: users.doc(docId[index]).get(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      print("data : $data");
                      return CardView(
                        imgUrl: data['concept_ImagURL'],
                        content: data['content'],
                        example: data['example'],
                        syntax: data['syntax'],
                        title: data['head'],
                      );
                    }
                    return LinearProgressIndicator();
                  }),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
