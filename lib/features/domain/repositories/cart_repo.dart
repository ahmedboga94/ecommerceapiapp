import 'package:dartz/dartz.dart';

import '../../../core/utils/failure.dart';
import '../entities/cart_entity.dart';
import '../entities/item_entity.dart';

abstract class CartRepo {
  Future<Either<Failure, List<ItemEntity>>> getCartItems(CartEntity cartEntity);
}
