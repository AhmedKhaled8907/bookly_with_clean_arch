import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


import '../../../../domain/entities/book_entity.dart';
import '../../../../domain/use_cases/fetch_similar_books_use_case.dart';


part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.fetchSimilarBooksUseCase) : super(SimilarBooksInitial());

  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;

  Future<void> fetchSimilarBooks() async {
    emit(SimilarBooksLoading());

    final result = await fetchSimilarBooksUseCase.call();

    result.fold(
      (failure) => emit(SimilarBooksFailure(failure.errMessage)),
      (books) => emit(SimilarBooksSuccess(books)),
    );
  }
}
