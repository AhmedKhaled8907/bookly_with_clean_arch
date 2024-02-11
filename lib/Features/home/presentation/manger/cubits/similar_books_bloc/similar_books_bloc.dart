import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:flutter/foundation.dart';

import '../../../../domain/entities/book_entity.dart';
import '../../../../domain/use_cases/fetch_similar_books_use_case.dart';

part 'similar_books_event.dart';
part 'similar_books_state.dart';

class SimilarBooksBloc extends Bloc<SimilarBooksEvent, SimilarBooksState> {
  SimilarBooksBloc(this.fetchSimilarBooksUseCase)
      : super(SimilarBooksInitial()) {
    on<SimilarBooksClickedEvent>(similarBooksClickedEvent);
  }
  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;

  FutureOr<void> similarBooksClickedEvent(
      SimilarBooksClickedEvent event, Emitter<SimilarBooksState> emit,
      {int pageNumber = 0}) async {
    emit(SimilarBooksLoading());
    final result = await fetchSimilarBooksUseCase.call(pageNumber);

    result.fold(
      (failure) => emit(SimilarBooksFailure(failure.errMessage)),
      (books) => emit(SimilarBooksSuccess(books)),
    );
  }
}
