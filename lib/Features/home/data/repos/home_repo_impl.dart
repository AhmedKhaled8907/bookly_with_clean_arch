import 'package:bookly_with_clean_arch/Features/home/domain/entities/book_entity.dart';

import 'package:bookly_with_clean_arch/core/error/failure.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repos/home_repo.dart';
import '../data_sourses/local_data/home_local_data_source.dart';
import '../data_sourses/remote_data/home_remote_data_source.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchFeaturedBooks();
      if (books.isNotEmpty) {
        return Right(books);
      }
      books = await homeRemoteDataSource.fetchFeaturedBooks();
      return Right(books);
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return Right(books);
      }
      books = await homeRemoteDataSource.fetchNewestBooks();
      return Right(books);
    } catch (e) {
      return Left(Failure());
    }
  }
}
