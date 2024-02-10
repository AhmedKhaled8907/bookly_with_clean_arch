import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookly_with_clean_arch/Features/home/domain/entities/book_entity.dart';

import 'package:flutter/foundation.dart';

import '../../../../domain/use_cases/fetch_featured_books_use_case.dart';

part 'featured_books_state.dart';
part 'featured_books_event.dart';

class FeaturedBooksBloc extends Bloc<FeaturedBooksEvent, FeaturedBooksState> {
  FeaturedBooksBloc(this.fetchFeaturedBooksUseCase)
      : super(FeaturedBooksInitial()) {
    on<FeaturedBooksClickedEvent>(featuredBooksClickedEvent);
  }

  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;

  FutureOr<void> featuredBooksClickedEvent(
    FeaturedBooksClickedEvent event,
    Emitter<FeaturedBooksState> emit, {
    int pageNumber = 0,
  }) async {
    emit(FeaturedBooksLoading());
    final result = await fetchFeaturedBooksUseCase.call(pageNumber);

    result.fold(
      (failure) => emit(FeaturedBooksFailure(failure.errMessage)),
      (books) => emit(FeaturedBooksSuccess(books)),
    );
  }
}
