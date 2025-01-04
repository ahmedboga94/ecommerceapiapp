import 'package:ecommerceapiapp/features/domain/entities/favorite_entity.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/item_entity.dart';
import '../../../domain/usecases/profile/get_user_favorite_items_use_case.dart';

class FavoriteProvider extends ChangeNotifier {
  final GetUserFavoriteItemsUseCase getUserFavoriteItemsUseCase;
  final String userId;

  List<ItemEntity> _itemsList = [];
  bool _isloading = false;
  String? _errorMessage;

  FavoriteProvider({
    required this.getUserFavoriteItemsUseCase,
    required this.userId,
  }) {
    getFavoriteItems();
  }

  List<ItemEntity> get itemsList => _itemsList;
  bool get isLoading => _isloading;
  String? get errorMessage => _errorMessage;

  void _setLoading(bool val) {
    _isloading = val;
    notifyListeners();
  }

  getFavoriteItems() async {
    _setLoading(true);
    final favUserID = FavoriteEntity(userId: userId);
    final result = await getUserFavoriteItemsUseCase.call(favUserID);
    result.fold(
      (failure) {
        debugPrint("============ ${failure.message} ============");
        _errorMessage = failure.message;
      },
      (response) {
        debugPrint("============ success items ============");
        _itemsList = response;
        notifyListeners();
      },
    );
    _setLoading(false);
  }

  addToFavorites(FavoriteEntity favorite) async {
    // final response = await http.post(
    //   Uri.parse("${baseUrl}add_to_favorites.php"),
    //   body: favorite.toJson(),
    // );

    // final data = json.decode(response.body);
    // if (data["status"] == "success") {
    //   fetchFavorites(favorite.userId);
    // }
  }

  removeFromFavorites(FavoriteEntity favorite) async {
    //   final response = await http.post(
    //     Uri.parse("${baseUrl}remove_from_favorites.php"),
    //     body: favorite.toJson(),
    //   );

    //   final data = json.decode(response.body);
    //   if (data["status"] == "success") {
    //     fetchFavorites(favorite.userId);
    //   }
    // }
  }

  void clearErrorMessage() {
    _errorMessage = null;
    notifyListeners();
  }
}
