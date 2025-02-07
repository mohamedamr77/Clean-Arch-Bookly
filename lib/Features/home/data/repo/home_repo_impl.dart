import 'package:cleanarchcleanarchbookly/Features/home/data/data_source/home_local_data_source.dart';
import 'package:cleanarchcleanarchbookly/Features/home/data/data_source/home_reomte_data_source.dart';
import 'package:cleanarchcleanarchbookly/Features/home/domain/entities/book_entity.dart';
import 'package:cleanarchcleanarchbookly/Features/home/domain/repos/home_repo.dart';
import 'package:cleanarchcleanarchbookly/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeatureBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchFeatureBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFeatureBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBook() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewestBook();
      if (books.isNotEmpty) {
        return right(books);
      }
       books = await homeRemoteDataSource.fetchNewestBook();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}