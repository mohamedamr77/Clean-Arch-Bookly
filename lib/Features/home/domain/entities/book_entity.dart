class BookEntity{
  final String? image;
  final String bookId;
  final String title;
  final String? authorName;
  final num? price;
  final num? rate ;

  BookEntity( {required this.bookId ,required this.image, required this.title, required this.authorName, required this.price, required this.rate});
}