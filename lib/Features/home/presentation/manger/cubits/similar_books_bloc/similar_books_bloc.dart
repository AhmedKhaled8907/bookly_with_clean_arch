import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:flutter/foundation.dart';

import '../../../../domain/entities/book_entity.dart';
import '../../../../domain/use_cases/fetch_similar_books_use_case.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.fetchSimilarBooksUseCase)
      : super(SimilarBooksInitial());

  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;
  Future<void> fetchSimilarBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(SimilarBooksLoading());
    } else {
      emit(SimilarBooksPaginaitonLoading());
    }
    var result = await fetchSimilarBooksUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(SimilarBooksFailure(failure.errMessage));
      } else {
        emit(SimilarBooksPaginaitonFailure(failure.errMessage));
      }
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
