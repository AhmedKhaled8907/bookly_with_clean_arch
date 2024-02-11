import 'package:bookly_with_clean_arch/Features/search/presentation/manger/cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';

class SearchResultText extends StatefulWidget {
  const SearchResultText({super.key});

  @override
  SearchResultTextState createState() => SearchResultTextState();
}

class SearchResultTextState extends State<SearchResultText> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return const Text(
            'Search Result',
            style: Styles.textStyle18,
          );
        } else {
          return const Text('');
        }
      },
    );
  }
}
