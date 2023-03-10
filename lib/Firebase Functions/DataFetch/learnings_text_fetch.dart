// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import '/constants.dart';

import '../../Screens/primaryScreens/Learning Pages/main_learning_card_content.dart';

class CollectionTextFetchFS extends StatefulWidget {
  const CollectionTextFetchFS({
    super.key,
  });

  @override
  State<CollectionTextFetchFS> createState() => _CollectionTextFetchFSState();
}

class _CollectionTextFetchFSState extends State<CollectionTextFetchFS> {
  List<String> docId = [];
  Future getDocIDs() async {
    await FirebaseFirestore.instance.collection('learnings').get().then(
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
        FirebaseFirestore.instance.collection('learnings');
    return Expanded(
      flex: 4,
      child: FutureBuilder(
          future: getDocIDs(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                          return LanguageChoiceCard(
                            head: data['language'] ?? "No data",
                            imgPath: data['imgURL'] ??
                                "https://aslucky-0143.web.app/assets/firebase.png",
                            subhead: data['learningscontext'] ?? "No data",
                          );
                        }
                        return LinearProgressIndicator();
                      }),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}

class LanguageChoiceCard extends StatefulWidget {
  final String head;
  final String subhead;
  final String imgPath;
  const LanguageChoiceCard({
    super.key,
    required this.head,
    required this.subhead,
    required this.imgPath,
  });

  @override
  State<LanguageChoiceCard> createState() => _LanguageChoiceCardState();
}

class _LanguageChoiceCardState extends State<LanguageChoiceCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LanguageInfoPage(
            collectionName: widget.head,
          ),
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            18,
          ),
          border: Border.all(color: c4, width: .15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurStyle: BlurStyle.outer,
              blurRadius: 12.0,
            ),
          ],
          color: dashCard,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                      widget.imgPath,
                    )),
              ),
              Text(
                widget.head,
                style: GoogleFonts.ptSerif(
                  color: c4,
                  fontSize: 18,
                ),
              ),
              Text(
                widget.subhead,
                style: GoogleFonts.ptSerif(
                  color: dashCardsubHead,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
