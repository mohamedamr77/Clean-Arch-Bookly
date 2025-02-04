import 'package:cleanarchcleanarchbookly/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/book_entity.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>,NoParameter>{
  final HomeRepo homeRepo;
  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<List<BookEntity>, Failure>> call([NoParameter? param]) async{
    return  await homeRepo.fetchNewestBook();
  }
}

abstract class UseCase<Type,Param> {
  Future<Either<Type,Failure>> call([Param param]);

}

class NoParameter{}