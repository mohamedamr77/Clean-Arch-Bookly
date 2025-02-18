import 'package:cleanarchcleanarchbookly/Features/home/domain/entities/book_entity.dart';
import 'package:cleanarchcleanarchbookly/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<Failure , List<BookEntity>>> fetchFeatureBooks();
  Future<Either<Failure, List<BookEntity>>>   fetchNewestBook();
}