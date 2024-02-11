import 'package:bookly_with_clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_with_clean_arch/Features/search/data/data_sources/search_remote_data_source.dart';
import 'package:bookly_with_clean_arch/Features/search/domain/repos/search_repo.dart';
import 'package:bookly_with_clean_arch/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl(this.searchRemoteDataSource);

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSearchBooks({
    int pageNumber = 0,
    required String subject,
  }) async {
    try {
      List<BookEntity> books = await searchRemoteDataSource.fetchSearchBooks(
        pageNumber: pageNumber,
        subject: subject,
      );
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
