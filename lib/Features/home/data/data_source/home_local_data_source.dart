import 'package:cleanarchcleanarchbookly/core/utils/app_box.dart';
import 'package:hive_flutter/adapters.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource{
  List<BookEntity> fetchFeatureBooks();
  List<BookEntity>  fetchNewestBook();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeatureBooks() {
    var box = Hive.box<BookEntity>(BoxApp.kFeaturedBookBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBook() {
    var box = Hive.box<BookEntity>(BoxApp.kNewestBookBox);
    return box.values.toList();
  }

}