import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';
import '../../entities/category_entity.dart';
import '../../repositories/home_repo.dart';

class GetCategoriesUseCase {
  final HomeRepo homeRepo;

  GetCategoriesUseCase(this.homeRepo);

  Future<Either<Failure, List<CategoryEntity>>> call() {
    return homeRepo.getGategories();
  }
}
