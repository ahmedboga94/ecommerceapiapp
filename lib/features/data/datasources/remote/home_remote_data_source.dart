import '../../../../core/constants/app_server_links.dart';
import '../../../../core/services/api_service.dart';
import '../../models/category_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<CategoryModel>> getCategories() async {
    Map data = await apiService.get(endPoint: AppServerLinks.homePageUrl);
    List<CategoryModel> cat = [];
    for (var doc in data.values) {
      cat.add(CategoryModel.fromJson(doc as Map<String, dynamic>));
    }
    return cat;
  }
}
