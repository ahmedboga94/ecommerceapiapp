import '../../../../core/constants/app_server_links.dart';
import '../../../../core/services/api_service.dart';
import '../../models/category_model.dart';
import '../../models/item_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<ItemModel>> getDiscountItems();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<CategoryModel>> getCategories() async {
    Map data = await apiService.get(endPoint: AppServerLinks.homePageUrl);
    List<CategoryModel> cat = [];
    for (var doc in data["categories"]) {
      cat.add(CategoryModel.fromJson(doc as Map<String, dynamic>));
    }
    return cat;
  }

  @override
  Future<List<ItemModel>> getDiscountItems() async {
    Map data = await apiService.get(endPoint: AppServerLinks.homePageUrl);
    List<ItemModel> cat = [];
    for (var doc in data["discountItems"]) {
      cat.add(ItemModel.fromJson(doc as Map<String, dynamic>));
    }
    return cat;
  }
}
