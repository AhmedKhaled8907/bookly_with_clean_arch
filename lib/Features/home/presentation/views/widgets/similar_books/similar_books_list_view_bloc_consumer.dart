import 'package:bookly_with_clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_with_clean_arch/core/utils/functions/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_circular_indicator.dart';
import '../../../../../../core/widgets/custom_error_widget.dart';
import '../../../manger/cubits/similar_books_bloc/similar_books_bloc.dart';
import 'similar_books_list_view.dart';

class SimilarBooksListviewBlocConsumer extends StatefulWidget {
  const SimilarBooksListviewBlocConsumer({super.key});

  @override
  State<SimilarBooksListviewBlocConsumer> createState() =>
      _SimilarBooksListviewBlocConsumerState();
}

class _SimilarBooksListviewBlocConsumerState
    extends State<SimilarBooksListviewBlocConsumer> {
  final List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBooksCubit, SimilarBooksState>(
      listener: (context, state) {
        if (state is SimilarBooksSuccess) {
          books.addAll(state.books);
        } else if (state is SimilarBooksPaginaitonFailure) {
          customSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is SimilarBooksSuccess ||
            state is SimilarBooksPaginaitonLoading) {
          return SimilarBooksListview(
            books: books,
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
