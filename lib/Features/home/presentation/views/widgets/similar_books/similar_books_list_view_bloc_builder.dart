import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_error_widget.dart';
import '../../../manger/cubits/similar_books_bloc/similar_books_bloc.dart';
import 'similar_books_list_view.dart';

class SimilarBooksListviewBlocBuilder extends StatelessWidget {
  const SimilarBooksListviewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksBloc, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SimilarBooksListview(
            books: state.books,
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
          );
        } else {
          return const CustomScrollView();
        }
      },
    );
  }
}
