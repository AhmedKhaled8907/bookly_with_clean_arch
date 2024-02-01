import 'package:bookly_with_clean_arch/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/entities/book_entity.dart';
import 'home_local_data_source.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBox);

    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}