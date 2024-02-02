import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';
import 'featured_list_view_bloc_builder.dart';

class FeaturedBooksSection extends StatelessWidget {
  const FeaturedBooksSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Featured Books',
          style: Styles.textStyle24,
        ),
        SizedBox(height: 20),
        FeaturedBooksListViewBlocBuilder(),
      ],
    );
  }
}
