import 'package:bookly_with_clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_with_clean_arch/Features/search/domain/repos/search_repo.dart';
import 'package:bookly_with_clean_arch/Features/search/domain/use_cases/search_use_case.dart';
import 'package:bookly_with_clean_arch/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class FetchSearchBooksUseCase
    extends SearchUseCase<List<BookEntity>, int, String> {
  final SearchRepo searchRepo;

  FetchSearchBooksUseCase(this.searchRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call(
    int param, {
    required String subject,
  }) async {
    return searchRepo.fetchSearchBooks(
      pageNumber: param,
      subject: subject,
    );
  }
}
