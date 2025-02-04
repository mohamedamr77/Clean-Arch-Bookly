import 'package:cleanarchcleanarchbookly/Features/home/domain/entities/book_entity.dart';
import 'package:cleanarchcleanarchbookly/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<List<BookEntity>,Failure>> fetchFeatureBooks();
  Future<Either<BookEntity, Failure>>   fetchNewestBook();
}