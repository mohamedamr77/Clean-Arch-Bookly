import 'package:hive_flutter/hive_flutter.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 1)
class BookEntity{
  @HiveField(0)
  final String? image;
  @HiveField(1)
  final String bookId;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? authorName;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? rate ;

  BookEntity( {required this.bookId ,required this.image, required this.title, required this.authorName, required this.price, required this.rate});
}