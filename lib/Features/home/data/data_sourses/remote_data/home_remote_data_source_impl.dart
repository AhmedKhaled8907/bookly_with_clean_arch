import 'package:bookly_with_clean_arch/constants.dart';
import 'package:bookly_with_clean_arch/core/utils/api_service.dart';

import '../../../../../core/utils/functions/get_books_list.dart';
import '../../../../../core/utils/functions/save_books_data.dart';
import '../../../domain/entities/book_entity.dart';
import 'home_remote_data_source.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  HomeRemoteDataSourceImpl(this.apiService);
  final ApiService apiService;

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    String endPoint =
        'volumes?Filtering=free-ebooks&q=subject:football&startIndex=${pageNumber * 10}';
    final data = await apiService.get(endPoint: endPoint);
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    String endPoint =
        'volumes?Filtering=free-ebooks&Sorting=newest&q=horror&startIndex=${pageNumber * 10}';
    final data = await apiService.get(endPoint: endPoint);
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kNewestBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({int pageNumber = 0}) async {
    String endPoint =
        'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:horror&startIndex=${pageNumber * 10}';
    final data = await apiService.get(endPoint: endPoint);
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kSimilarBox);
    return books;
  }

  
}
