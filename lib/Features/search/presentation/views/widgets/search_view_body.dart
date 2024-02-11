import 'package:bookly_with_clean_arch/Features/search/presentation/views/widgets/search_result_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

import 'custom_search_form_text_field.dart';
import 'search_view_body_bloc_consumer.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchFormTextField(),
          SizedBox(height: 24),
          SearchResultText(),
          SizedBox(height: 24),
          Expanded(
            child: SearchResultListViewBlocConsumer(),
          ),
        ],
      ),
    );
  }
}
