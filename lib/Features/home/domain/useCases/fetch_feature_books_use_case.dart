import 'package:cleanarchcleanarchbookly/Features/home/domain/repos/home_repo.dart';
import 'package:cleanarchcleanarchbookly/core/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/book_entity.dart';

class FetchFeatureBooksUseCase implements UseCase<List<BookEntity>,NoParameter>{
  HomeRepo homeRepo ;
  FetchFeatureBooksUseCase(this.homeRepo);

  @override
  Future<Either<List<BookEntity>, Failure>> call([NoParameter? param]) async{
    return await homeRepo.fetchFeatureBooks();
  }
}