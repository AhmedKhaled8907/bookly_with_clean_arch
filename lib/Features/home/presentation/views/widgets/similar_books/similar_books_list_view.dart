import 'package:flutter/material.dart';

import '../custom_book_item.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: CustomBookImage(
                imageUrl:
                    'https://www.theguardian.com/football/2018/jul/11/cristiano-ronaldo-leaving-real-madrid-end-cold#img-1',
              ),
            );
          }),
    );
  }
}
