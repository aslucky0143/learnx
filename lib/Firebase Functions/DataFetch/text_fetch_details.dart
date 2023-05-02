// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls, must_be_immutable
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/constants.dart';
import 'package:learnx/constants.dart';

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
        if (docId.isEmpty) {
          return Text("No data available");
        }
        return Container(
          margin: EdgeInsets.only(bottom: 100),
          child: PageView.builder(
            itemCount: docId.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: FutureBuilder<DocumentSnapshot>(
                  future: users.doc(docId[index]).get(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      print(data);
                      return CardAdder(
                        a: data,
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

class CardAdder extends StatefulWidget {
  CardAdder({super.key, required this.a});
  Map<String, dynamic> a;
  @override
  State<CardAdder> createState() => _CardAdderState();
}

class _CardAdderState extends State<CardAdder> {
  @override
  void initState() {
    current_list.add(CardPrototype(
      imgUrl: widget.a['concept_ImagURL'],
      content: widget.a['content'],
      example: widget.a['example'],
      syntax: widget.a['syntax'],
      title: widget.a['head'],
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ContentView extends StatelessWidget {
  ContentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class CardPrototype extends StatefulWidget {
  CardPrototype({
    required this.imgUrl,
    required this.content,
    required this.example,
    required this.syntax,
    required this.title,
    super.key,
  });

  String imgUrl, title, content, syntax, example;

  @override
  State<CardPrototype> createState() => _CardPrototypeState();
}

class _CardPrototypeState extends State<CardPrototype> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xff9a94f7),
          border: Border.all(color: Colors.white, width: 2.5),
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image of the concenpt
          Container(
            margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(widget.imgUrl)),
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  18,
                ),
              ),
            ),
          ),
          //Body of the card
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(color: Colors.white, fontSize: 36),
                ),
                FittedBox(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 36,
                    child: Text(
                      widget.content,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      maxLines: 4,
                    ),
                  ),
                ),
                Text(
                  "Syntax",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Text(
                  widget.syntax,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Text(
                  "Example",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Text(
                  widget.example,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
