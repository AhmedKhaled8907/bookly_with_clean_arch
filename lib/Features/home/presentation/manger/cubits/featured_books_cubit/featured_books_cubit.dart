import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../../domain/entities/book_entity.dart';
import '../../../../domain/use_cases/fetch_featured_books_use_case.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginaitonLoading());
    }
    var result = await featuredBooksUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(FeaturedBooksFailure(failure.errMessage));
      } else {
        emit(FeaturedBooksPaginaitonFailure(failure.errMessage));
      }
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
