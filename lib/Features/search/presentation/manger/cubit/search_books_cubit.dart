import 'package:bloc/bloc.dart';
import 'package:bookly_with_clean_arch/Features/search/domain/use_cases/fetch_search_books_use_case.dart';
import 'package:flutter/foundation.dart';

import '../../../../home/domain/entities/book_entity.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.fetchSearchBooksUseCase) : super(SearchBooksInitial());

  final FetchSearchBooksUseCase fetchSearchBooksUseCase;

  Future<void> fetchSearchBooks({
    int pageNumber = 0,
    required String subject,
  }) async {
    emit(SearchBooksLoading());
    final result = await fetchSearchBooksUseCase.call(
      pageNumber,
      subject: subject,
    );
    result.fold(
      (failure) => emit(SearchBooksFailure(failure.errMessage)),
      (books) => emit(SearchBooksSuccess(books)),
    );
  }
}
