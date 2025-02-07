import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/services/app_network_checker.dart';
import '../../../core/utils/failure.dart';
import '../../domain/entities/cart_entity.dart';
import '../../domain/entities/item_entity.dart';
import '../../domain/repositories/cart_repo.dart';
import '../datasources/remote/cart_remote_data_source.dart';
import '../models/cart_model.dart';

class CartRepoImpl implements CartRepo {
  CartRemoteDataSource cartRemoteDataSource;
  final AppNetworkChecker appNetworkChecker;

  CartRepoImpl({
    required this.cartRemoteDataSource,
    required this.appNetworkChecker,
  });

  @override
  Future<Either<Failure, List<ItemEntity>>> getCartItems(
      CartEntity cartEntity) async {
    if (await appNetworkChecker.isConnected) {
      try {
        final cart = CartModel(userId: cartEntity.userId);
        final response = await cartRemoteDataSource.getCartItems(cart);
        return right(response);
      } catch (e) {
        if (e is DioException) {
          return left(ServerFaliure.fromDioError(e));
        } else {
          return left(ServerFaliure(message: "$e"));
        }
      }
    } else {
      return left(
        OfflineFailure(message: "Your Device is not connecting to Internet"),
      );
    }
  }
}
