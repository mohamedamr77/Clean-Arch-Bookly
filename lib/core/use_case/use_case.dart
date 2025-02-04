import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class UseCase<Type,Param> {
  Future<Either<Type,Failure>> call([Param param]);

}

class NoParameter{}