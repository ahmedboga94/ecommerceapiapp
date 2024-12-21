import '../../../../core/constants/app_server_links.dart';
import '../../../../core/services/api_service.dart';
import '../../models/category_model.dart';
import '../../models/item_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<ItemModel>> getCategoryItems(CategoryModel selectedCategory);
  Future<List<ItemModel>> getDiscountItems();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<CategoryModel>> getCategories() async {
    Map data = await apiService.get(endPoint: AppServerLinks.homePageUrl);
    List<CategoryModel> list = [];
    for (var doc in data["categories"]) {
      list.add(CategoryModel.fromJson(doc as Map<String, dynamic>));
    }
    return list;
  }

  @override
  Future<List<ItemModel>> getCategoryItems(
      CategoryModel selectedCategory) async {
    Map data = await apiService.post(
      endPoint: AppServerLinks.itemsUrl,
      body: selectedCategory.toJson(),
    );
    List<ItemModel> list = [];
    for (var doc in data["data"]) {
      list.add(ItemModel.fromJson(doc as Map<String, dynamic>));
    }
    return list;
  }

  @override
  Future<List<ItemModel>> getDiscountItems() async {
    Map data = await apiService.get(endPoint: AppServerLinks.homePageUrl);
    List<ItemModel> list = [];
    for (var doc in data["discountItems"]) {
      list.add(ItemModel.fromJson(doc as Map<String, dynamic>));
    }
    return list;
  }
}
