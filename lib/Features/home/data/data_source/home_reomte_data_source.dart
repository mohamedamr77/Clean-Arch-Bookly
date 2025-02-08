import 'package:cleanarchcleanarchbookly/core/helper/api_service.dart';
import 'package:cleanarchcleanarchbookly/core/utils/app_box.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/functions/save_books.dart';
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
  return await getBooks(endPoint: "volumes?q=AI&Filtering =free", nameBox: BoxApp.kFeaturedBookBox);
  }

  @override
  Future<List<BookEntity>> fetchNewestBook() async{
     return await getBooks(endPoint: "volumes?q=programming&Filtering =free&sorting =newest", nameBox: BoxApp.kNewestBookBox);
  }

  Future<List<BookEntity>> getBooks({required String endPoint , required String nameBox}) async{
    var  data= await apiService.get(endpoint: endPoint);
    List <dynamic> itemsFromJson = data["items"];
    List<BookEntity> books = itemsFromJson.map((json) => BookModel.fromJson(json)).toList();
    saveBooks(nameBox: nameBox, books: books);
    return books;
  }
}