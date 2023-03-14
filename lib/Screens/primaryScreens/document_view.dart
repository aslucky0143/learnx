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

class CardCollection extends StatefulWidget {
  const CardCollection({
    Key? key,
  }) : super(key: key);

  @override
  State<CardCollection> createState() => _CardCollectionPageState();
}

class _CardCollectionPageState extends State<CardCollection> {
  final CardSwiperController controller = CardSwiperController();
  String? title, content, syntax, example, img;

  List<Widget> cards = [
    CardView(
      content: "defines the start and end of an HTML document",
      example: "<html></html>",
      imgUrl: "assets/images/applogo.png",
      title: "HTML Tag",
      syntax: "<html></html>",
    )
  ];
  @override
  void initState() {
    super.initState();
    cards.add(CardView(
      content:
          " used to create hyperlinks to other web pages, documents, or specific locations within the same page",
      example: "<a href='https://www.google.com/'> Google </a>",
      imgUrl: "assets/images/applogo.png",
      title: "<a> Tag",
      syntax: "<a href='weblink'> Text </a>",
    ));
    print(cards.toString());
  }

  @override
  void dispose() {
    super.dispose();
    cards = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: CardSwiper(
                controller: controller,
                cards: cards,
                onSwipe: _swipe,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: "tag1",
                    onPressed: controller.swipe,
                    child: const Icon(Icons.rotate_right),
                  ),
                  FloatingActionButton(
                    heroTag: "tag2",
                    onPressed: controller.swipeLeft,
                    child: const Icon(Icons.keyboard_arrow_left),
                  ),
                  FloatingActionButton(
                    heroTag: "tag3",
                    onPressed: controller.swipeRight,
                    child: const Icon(Icons.keyboard_arrow_right),
                  ),
                  FloatingActionButton(
                    heroTag: "tag4",
                    onPressed: controller.swipeTop,
                    child: const Icon(Icons.keyboard_arrow_up),
                  ),
                  FloatingActionButton(
                    heroTag: "tag5",
                    onPressed: controller.swipeBottom,
                    child: const Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _swipe(int index, CardSwiperDirection direction) {}
}
