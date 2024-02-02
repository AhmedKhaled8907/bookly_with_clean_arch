import 'package:bookly_with_clean_arch/Features/home/presentation/manger/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_with_clean_arch/core/widgets/custom_circular_indicator.dart';
import 'package:bookly_with_clean_arch/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'featured_list_view.dart';

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return const FeaturedBooksListView();
        } else if (state is FeaturedBooksFailure) {
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
