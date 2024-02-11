import 'package:bookly_with_clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_with_clean_arch/Features/search/domain/repos/search_repo.dart';
import 'package:bookly_with_clean_arch/core/error/failure.dart';
import 'package:bookly_with_clean_arch/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchSearchBooksUseCase extends UseCase<List<BookEntity>, int> {
  final SearchRepo searchRepo;

  FetchSearchBooksUseCase(this.searchRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param = 0]) async {
    return await searchRepo.fetchSearchBooks(pageNumber: param);
  }
}
