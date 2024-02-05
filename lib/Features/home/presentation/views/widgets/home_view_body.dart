import 'package:bookly_with_clean_arch/Features/home/presentation/manger/cubits/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_with_clean_arch/core/widgets/custom_circular_indicator.dart';
import 'package:bookly_with_clean_arch/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styles.dart';
import 'newsest_books/newest_books_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_books/featured_books_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                FeaturedBooksSection(),
                SizedBox(height: 50),
                Text(
                  'Newest Books',
                  style: Styles.textStyle24,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          SliverFillRemaining(
            child: NewestBooksListViewBlocBuilder(),
          ),
        ],
      ),
    );
  }
}

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
