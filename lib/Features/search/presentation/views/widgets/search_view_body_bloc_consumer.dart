import 'package:bookly_with_clean_arch/Features/search/presentation/manger/cubit/search_books_cubit.dart';
import 'package:bookly_with_clean_arch/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_circular_indicator.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import 'search_result_list_view.dart';

class SearchResultListViewBlocConsumer extends StatelessWidget {
  const SearchResultListViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBooksCubit, SearchBooksState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return SearchResultListView(
            books: state.books,
          );
        } else if (state is SearchBooksFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
          );
        } else if (state is SearchBooksLoading) {
          return const CustomCircularIndicator();
        } else {
          return const Center(
            child: Text(
              'Try write something',
              style: Styles.textStyle18,
            ),
          );
        }
      },
    );
  }
}
