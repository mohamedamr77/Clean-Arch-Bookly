import 'package:hive_flutter/adapters.dart';

import '../../Features/home/domain/entities/book_entity.dart';

saveBooks({required String nameBox, required List<BookEntity> books}){
  var box= Hive.box<BookEntity>(nameBox);
  box.clear();
  box.addAll(books);
}