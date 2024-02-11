part of 'similar_books_bloc.dart';

@immutable
sealed class SimilarBooksState {}

final class SimilarBooksInitial extends SimilarBooksState {}


final class SimilarBooksLoading extends SimilarBooksState {}

class SimilarBooksPaginaitonLoading extends SimilarBooksState {}

class SimilarBooksPaginaitonFailure extends SimilarBooksState {
  final String errMessage;

  SimilarBooksPaginaitonFailure(this.errMessage);
}

final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookEntity> books;

  SimilarBooksSuccess(this.books);
}

final class SimilarBooksFailure extends SimilarBooksState {
  final String errMessage;

  SimilarBooksFailure(this.errMessage);
}
