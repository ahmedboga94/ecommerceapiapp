import 'package:dartz/dartz.dart';
import '../../../../core/utils/failure.dart';
import '../../entities/item_entity.dart';
import '../../repositories/home_repo.dart';

class GetDiscountItemsUseCase {
  final HomeRepo _homeRepo;

  GetDiscountItemsUseCase(this._homeRepo);

  Future<Either<Failure, List<ItemEntity>>> call() {
    return _homeRepo.getDiscountItems();
  }
}
