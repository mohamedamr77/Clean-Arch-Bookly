import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource{
  List<BookEntity> fetchFeatureBooks();
  List<BookEntity>  fetchNewestBook();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeatureBooks() {
    // TODO: implement fetchFeatureBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBook() {
    // TODO: implement fetchNewestBook
    throw UnimplementedError();
  }

}