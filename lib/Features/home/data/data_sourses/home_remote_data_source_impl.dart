import 'package:bookly_with_clean_arch/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_with_clean_arch/core/utils/api_service.dart';

import '../../domain/entities/book_entity.dart';
import 'home_remote_data_source.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  HomeRemoteDataSourceImpl(this.apiService);
  final ApiService apiService;

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    const endPoint = 'volumes?Filtering=free-ebooks&q=programming';
    final data = await apiService.get(endPoint: endPoint);
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    const endPoint =
        'volumes?Filtering=free-ebooks&Sorting=newest&q=fantasy';
    final data = await apiService.get(endPoint: endPoint);
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }
}
