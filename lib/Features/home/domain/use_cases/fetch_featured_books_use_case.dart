import 'package:bookly_with_clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_with_clean_arch/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_with_clean_arch/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/use_cases/use_case.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async {
    return await homeRepo.fetchFeaturedBooks();
  }
}
