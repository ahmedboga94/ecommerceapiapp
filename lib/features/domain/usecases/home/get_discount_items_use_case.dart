import 'package:dartz/dartz.dart';
import '../../../../core/utils/failure.dart';
import '../../entities/item_entity.dart';
import '../../repositories/home_repo.dart';

class GetDiscountItemsUseCase {
  final HomeRepo homeRepo;

  GetDiscountItemsUseCase(this.homeRepo);

  Future<Either<Failure, List<ItemEntity>>> call() {
    return homeRepo.getDiscountItems();
  }
}
