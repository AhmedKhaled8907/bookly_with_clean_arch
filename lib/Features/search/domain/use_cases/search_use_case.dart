import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class SearchUseCase<Type, Param, subject> {
  Future<Either<Failure, Type>> call(
    Param param, {
    required String subject,
  });
}

