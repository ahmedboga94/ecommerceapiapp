import '../../../../core/constants/app_server_links.dart';
import '../../../../core/services/api_service.dart';
import '../../models/cart_model.dart';
import '../../models/item_model.dart';

abstract class CartRemoteDataSource {
  Future<List<ItemModel>> getCartItems(CartModel cartModel);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiService apiService;
  CartRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<ItemModel>> getCartItems(CartModel cartModel) async {
    Map data = await apiService.post(
      endPoint: AppServerLinks.viewCart,
      body: cartModel.toJson(),
    );
    List<ItemModel> list = [];
    for (var doc in data["data"]) {
      list.add(ItemModel.fromJson(doc as Map<String, dynamic>));
    }
    return list;
  }
}
