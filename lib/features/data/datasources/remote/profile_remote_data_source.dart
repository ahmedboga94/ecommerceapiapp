import '../../../../core/constants/app_server_links.dart';
import '../../../../core/services/api_service.dart';
import '../../models/favorite_model.dart';
import '../../models/item_model.dart';

abstract class ProfileRemoteDataSource {
  Future<List<ItemModel>> getUserFavoriteItems(FavoriteModel favoriteModel);
  Future<Map<String, dynamic>>  addFavoriteItems(FavoriteModel favoriteModel);
  Future<Map<String, dynamic>>  removeFavoriteItems(FavoriteModel favoriteModel);
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final ApiService apiService;
  ProfileRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<ItemModel>> getUserFavoriteItems(
      FavoriteModel favoriteModel) async {
    Map data = await apiService.post(
      endPoint: AppServerLinks.viewFavorites,
      body: favoriteModel.toJson(),
    );
    List<ItemModel> list = [];
    for (var doc in data["data"]) {
      list.add(ItemModel.fromJson(doc as Map<String, dynamic>));
    }
    return list;
  }

  @override
  Future<Map<String, dynamic>>  addFavoriteItems(FavoriteModel favoriteModel) async {
    var response = await apiService.post(
      endPoint: AppServerLinks.addFavorite,
      body: favoriteModel.toJson(),
    );
    return response;
  }

  @override
  Future<Map<String, dynamic>>  removeFavoriteItems(FavoriteModel favoriteModel) async {
    var response = await apiService.post(
      endPoint: AppServerLinks.removeFavorite,
      body: favoriteModel.toJson(),
    );
    return response;
  }
}
