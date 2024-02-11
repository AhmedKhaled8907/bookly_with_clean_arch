import 'package:bookly_with_clean_arch/core/utils/api_service.dart';
import 'package:bookly_with_clean_arch/core/utils/functions/get_books_list.dart';

import '../../../home/domain/entities/book_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> fetchSearchBooks({
    int pageNumber = 0,
    required String subject,
  });
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchSearchBooks({
    int pageNumber = 0,
    required String subject,
  }) async {
    String endPonit =
        'volumes?Filtering=free-ebooks&Sorting=relevance&q=$subject:horror&startIndex=${pageNumber * 10}';
    final data = await apiService.get(endPoint: endPonit);
    List<BookEntity> books = getBooksList(data);
    return books;
  }
}
