import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerceapiapp/features/data/models/category_model.dart';
import 'package:ecommerceapiapp/features/domain/entities/item_entity.dart';
import '../../../core/services/app_network_checker.dart';
import '../../../core/utils/failure.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/home_repo.dart';
import '../datasources/remote/home_remote_data_source.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final AppNetworkChecker appNetworkChecker;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.appNetworkChecker,
  });
  @override
  Future<Either<Failure, List<CategoryEntity>>> getGategories() async {
    if (await appNetworkChecker.isConnected) {
      try {
        final response = await homeRemoteDataSource.getCategories();
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

  @override
  Future<Either<Failure, List<ItemEntity>>> getCategoryItems(
      CategoryEntity selectedCategory) async {
    if (await appNetworkChecker.isConnected) {
      try {
        final categoryId =
            CategoryModel(categoryId: selectedCategory.categoryId);
        final response =
            await homeRemoteDataSource.getCategoryItems(categoryId);
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

  @override
  Future<Either<Failure, List<ItemEntity>>> getDiscountItems() async {
    if (await appNetworkChecker.isConnected) {
      try {
        final response = await homeRemoteDataSource.getDiscountItems();
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
