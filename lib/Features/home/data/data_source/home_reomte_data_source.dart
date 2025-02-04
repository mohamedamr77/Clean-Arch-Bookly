import 'package:cleanarchcleanarchbookly/core/helper/api_service.dart';

import '../../domain/entities/book_entity.dart';
import '../model/book_model/book_model.dart';

abstract class HomeRemoteDataSource{
  Future<List<BookEntity>> fetchFeatureBooks();
  Future<List<BookEntity>>   fetchNewestBook();
}
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeatureBooks() async{
  return await getBooks(endPoint: "volumes?q=programming&Filtering =free");
  }

  @override
  Future<List<BookEntity>> fetchNewestBook() async{
     return await getBooks(endPoint: "volumes?q=programming&Filtering =free&sorting =newest");
  }

  Future<List<BookEntity>> getBooks({required String endPoint}) async{
    var  data= await apiService.get(endpoint: endPoint);
    List <dynamic> itemsFromJson = data["items"];
    List<BookEntity> books = itemsFromJson.map((json) => BookModel.fromJson(json)).toList();
    return books;
  }
}