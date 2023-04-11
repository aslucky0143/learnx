// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  CardView({
    required this.imgUrl,
    required this.content,
    required this.example,
    required this.syntax,
    required this.title,
    super.key,
  });

  String imgUrl, title, content, syntax, example;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
                  image: DecorationImage(image: NetworkImage(imgUrl)),
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
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 36),
                    ),
                    FittedBox(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 36,
                        child: Text(
                          content,
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
                      syntax,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Text(
                      "Example",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Text(
                      example,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
