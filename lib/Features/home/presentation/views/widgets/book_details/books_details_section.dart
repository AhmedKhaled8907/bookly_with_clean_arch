import 'package:bookly_with_clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';
import '../book_rating.dart';
import '../books_action.dart';
import '../custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});

  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: Hero(
            tag: book,
            child: CustomBookImage(
              imageUrl: book.image ?? '',
            ),
          ),
        ),
        const SizedBox(height: 43),
        Text(
          book.title,
          textAlign: TextAlign.center,
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: .7,
          child: Text(
            book.author ?? '',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 18),
        BookRating(
          rating: book.rating ?? 0,
          ratingsCount: book.ratingsCount ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 37),
        BooksAction(book: book),
      ],
    );
  }
}
