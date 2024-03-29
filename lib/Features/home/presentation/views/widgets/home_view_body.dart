import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_app_bar.dart';
import 'featured_books/featured_books_section.dart';
import 'newsest_books/newest_books_list_view_bloc_consumer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
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
            child: NewestBooksListViewBlocConsumer(),
          ),
        ],
      ),
    );
  }
}
