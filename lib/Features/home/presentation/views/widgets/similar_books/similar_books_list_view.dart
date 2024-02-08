import 'package:bookly_with_clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_router.dart';
import '../custom_book_item.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key, required this.books});

  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.175,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).pushReplacement(
                    AppRouter.kBookDetailsView,
                    extra: books[index],
                  );
                },
                child: CustomBookImage(
                  imageUrl: books[index].image ?? '',
                ),
              ),
            );
          }),
    );
  }
}
