import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_circular_indicator.dart';
import '../../../../../../core/widgets/custom_error_widget.dart';
import '../../../manger/cubits/newest_books_cubit/newest_books_cubit.dart';
import 'newest_books_list_view.dart';

class NewestBooksListViewBlocBuilder extends StatelessWidget {
  const NewestBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return NewestBooksListView(
            books: state.books,
          );
        } else if (state is NewestBooksFailure) {
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
