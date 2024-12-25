import '../../../../core/constants/app_server_links.dart';
import '../../../../core/services/api_service.dart';
import '../../models/item_model.dart';

abstract class ProfileRemoteDataSource {
  Future<List<ItemModel>> getUserFavoriteItems();
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final ApiService apiService;
  ProfileRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<ItemModel>> getUserFavoriteItems() async {
    Map data = await apiService.post(
      endPoint: AppServerLinks.viewFavorites,
      body: {
        "favorite_userid": "61",
      },
    );
    List<ItemModel> list = [];
    for (var doc in data["data"]) {
      list.add(ItemModel.fromJson(doc as Map<String, dynamic>));
    }
    return list;
  }
}
