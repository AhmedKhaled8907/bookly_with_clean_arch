import 'package:bookly_with_clean_arch/core/widgets/custom_circular_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/widgets/custom_error_widget.dart';
import '../../../manger/cubits/similar_books_bloc/similar_books_bloc.dart';
import '../custom_book_image.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksBloc, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pushReplacement(
                          AppRouter.kBookDetailsView,
                          extra: state.books[index],
                        );
                      },
                      child: Hero(
                        tag: state.books[index],
                        child: CustomBookImage(
                          imageUrl: state.books[index].image ?? '',
                        ),
                      ),
                    ),
                  );
                }),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
          );
        } else {
          return const CustomCircularIndicator();
        }
      },
    );
  }
}
