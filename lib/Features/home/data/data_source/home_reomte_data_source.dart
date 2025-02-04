import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource{
  Future<List<BookEntity>> fetchFeatureBooks();
  Future<List<BookEntity>>   fetchNewestBook();
}
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{
  @override
  Future<List<BookEntity>> fetchFeatureBooks() {
    // TODO: implement fetchFeatureBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntity>> fetchNewestBook() {
    // TODO: implement fetchNewestBook
    throw UnimplementedError();
  }

}