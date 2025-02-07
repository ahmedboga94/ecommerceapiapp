import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';
import '../../entities/cart_entity.dart';
import '../../entities/item_entity.dart';
import '../../repositories/cart_repo.dart';

class GetCartItemsUseCase {
  final CartRepo _cartRepo;

  GetCartItemsUseCase(this._cartRepo);

  Future<Either<Failure, List<ItemEntity>>> call(CartEntity cartEntity) {
    return _cartRepo.getCartItems(cartEntity);
  }
}
