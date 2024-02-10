import 'package:hive_flutter/hive_flutter.dart';

import '../../../Features/home/domain/entities/book_entity.dart';
import '../../../constants.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  await Hive.openBox<BookEntity>(kSimilarBox);
}
