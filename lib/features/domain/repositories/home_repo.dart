import 'package:dartz/dartz.dart';
import '../../../core/utils/failure.dart';
import '../entities/category_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoryEntity>>> getGategories();
}
