import 'package:cleanarchcleanarchbookly/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/book_entity.dart';

class FetchFeatureBooksUseCase{
  HomeRepo homeRepo ;
  FetchFeatureBooksUseCase(this.homeRepo);
  
  Future<Either<List<BookEntity>,Failure>> call(){
    // can i make condition before fetch books or after fetch books in this method
   return homeRepo.fetchFeatureBooks();
   }
}