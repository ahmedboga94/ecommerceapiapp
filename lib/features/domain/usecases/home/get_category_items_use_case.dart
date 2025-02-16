import 'package:dartz/dartz.dart';
import '../../../../core/utils/failure.dart';
import '../../entities/category_entity.dart';
import '../../entities/item_entity.dart';
import '../../repositories/home_repo.dart';

class GetCategoryItemsUseCase {
  final HomeRepo _homeRepo;

  GetCategoryItemsUseCase(this._homeRepo);

  Future<Either<Failure, List<ItemEntity>>> call(
      CategoryEntity selectedCategory) {
    return _homeRepo.getCategoryItems(selectedCategory);
  }
}
