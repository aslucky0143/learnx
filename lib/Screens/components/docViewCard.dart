// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

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
    return Container(
      child: CardSwiper(
          cardBuilder: (context, index) {
            return Text("");
          },
          cardsCount: 10),
    );
  }
}
