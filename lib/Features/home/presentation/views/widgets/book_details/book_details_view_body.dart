import 'package:bookly_with_clean_arch/Features/home/domain/entities/book_entity.dart';

import 'package:flutter/material.dart';

import 'books_details_section.dart';
import 'custom_book_details_app_bar.dart';
import '../similar_books/similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.book}) : super(key: key);

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          // Your app bar configurations here
          title: CustomBookDetailsAppBar(),
          // Other SliverAppBar configurations...
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                BookDetailsSection(book: book),
                const SizedBox(height: 50),
                const SimilarBooksSection(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
