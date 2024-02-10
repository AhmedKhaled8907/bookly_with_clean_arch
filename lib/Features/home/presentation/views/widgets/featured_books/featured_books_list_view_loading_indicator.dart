import 'package:bookly_with_clean_arch/Features/home/presentation/views/widgets/custom_book_image_loading_indicator.dart';
import 'package:bookly_with_clean_arch/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';


class FeaturedBooksListViewLoadingIndicator extends StatelessWidget {
  const FeaturedBooksListViewLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFaddingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(right: 12),
              child: CustomBookImageLoadingIndicator(),
            );
          },
        ),
      ),
    );
  }
}
