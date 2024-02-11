import 'package:bookly_with_clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_with_clean_arch/Features/home/presentation/manger/cubits/similar_books_bloc/similar_books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_router.dart';
import '../custom_book_image.dart';

class SimilarBooksListview extends StatefulWidget {
  const SimilarBooksListview({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<SimilarBooksListview> createState() => _SimilarBooksListviewState();
}

class _SimilarBooksListviewState extends State<SimilarBooksListview> {
  late ScrollController _scrollController;
  var nextPage = 1;
  var isloading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final currentPosition = _scrollController.position.pixels;
    final maxScrollMax = _scrollController.position.maxScrollExtent;
    if (currentPosition >= maxScrollMax * 0.7) {
      if (!isloading) {
        isloading = true;
        BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
          pageNumber: nextPage++,
        );
        isloading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).pushReplacement(
                    AppRouter.kBookDetailsView,
                    extra: widget.books[index],
                  );
                },
                child: CustomBookImage(
                  imageUrl: widget.books[index].image ?? '',
                ),
              ),
            );
          }),
    );
  }
}
