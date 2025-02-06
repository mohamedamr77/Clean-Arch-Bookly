import 'package:cleanarchcleanarchbookly/Features/home/data/data_source/home_local_data_source.dart';
import 'package:cleanarchcleanarchbookly/Features/home/data/data_source/home_reomte_data_source.dart';
import 'package:cleanarchcleanarchbookly/Features/home/domain/entities/book_entity.dart';
import 'package:cleanarchcleanarchbookly/Features/home/domain/repos/home_repo.dart';
import 'package:cleanarchcleanarchbookly/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeatureBooks() async {
    try {
      var dataLocal = homeLocalDataSource.fetchFeatureBooks();
      if (dataLocal.isNotEmpty) {
        return right(dataLocal);
      }
      var data = await homeRemoteDataSource.fetchFeatureBooks();
      return right(data);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBook() async {
    try {
      var dataLocal = homeLocalDataSource.fetchNewestBook();
      if (dataLocal.isNotEmpty) {
        return right(dataLocal);
      }
      var data = await homeRemoteDataSource.fetchNewestBook();
      return right(data);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}