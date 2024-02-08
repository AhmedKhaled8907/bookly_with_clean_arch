part of 'similar_books_bloc.dart';

@immutable
sealed class SimilarBooksEvent {}

final class SimilarBooksClickedEvent extends SimilarBooksEvent {}
