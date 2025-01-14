import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/di/init_di.dart';
import '../../../../core/functions/show_snack_bar.dart';
import '../../../domain/entities/favorite_entity.dart';
import '../../../domain/entities/item_entity.dart';
import '../../../domain/usecases/profile/add_favorite_items_use_case.dart';
import '../../../domain/usecases/profile/get_user_favorite_items_use_case.dart';
import '../../../domain/usecases/profile/remove_favorite_items_use_case.dart';

class FavoriteProvider extends ChangeNotifier {
  final GetUserFavoriteItemsUseCase getUserFavoriteItemsUseCase;
  final AddFavoriteItemsUseCase addFavoriteItemsUseCase;
  final RemoveFavoriteItemsUseCase removeFavoriteItemsUseCase;

  List<ItemEntity> _itemsList = [];
  List<String> _favouritesItemIDsList = [];
  bool _isloading = false;
  String? _errorMessage;

  FavoriteProvider({
    required this.getUserFavoriteItemsUseCase,
    required this.addFavoriteItemsUseCase,
    required this.removeFavoriteItemsUseCase,
  }) {
    getFavoriteItems();
  }

  List<ItemEntity> get itemsList => _itemsList;
  get favIDList => _favouritesItemIDsList;
  bool get isLoading => _isloading;
  String? get errorMessage => _errorMessage;
  String? userId = di<SharedPreferences>().getString(AppStrings.userId);

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
        _favouritesItemIDsList = response.map((e) => e.itemId!).toList();
      },
    );
    _setLoading(false);
  }

  addToFavorites(String itemId) async {
    _setLoading(true);
    final favUserID = FavoriteEntity(userId: userId, itemId: itemId);
    final result = await addFavoriteItemsUseCase.call(favUserID);
    result.fold(
      (failure) {
        debugPrint("============ ${failure.message} ============");
        _errorMessage = failure.message;
      },
      (response) {
        debugPrint("============ add to favorite ============");
      },
    );
    getFavoriteItems();
  }

  removeFromFavorites(String itemId) async {
    _setLoading(true);
    final favUserID = FavoriteEntity(userId: userId, itemId: itemId);
    final result = await removeFavoriteItemsUseCase.call(favUserID);
    result.fold(
      (failure) {
        debugPrint("============ ${failure.message} ============");
        _errorMessage = failure.message;
      },
      (response) {
        debugPrint("============ remove from favorite ============");
        _itemsList.removeWhere((item) => item.itemId == itemId);
        _favouritesItemIDsList.removeWhere((item) => item == itemId);
      },
    );
    getFavoriteItems();
  }

  checkItemInFav(BuildContext context, String itemId) async {
    if (!_favouritesItemIDsList.contains(itemId)) {
      addToFavorites(itemId);
      showSnackBar(context, msg: "Added to favorite");
    } else {
      removeFromFavorites(itemId);
      showSnackBar(context, msg: "Remove from favorite");
    }
    notifyListeners();
  }

  bool checkFavedIco(String itemId) {
    if (_favouritesItemIDsList.contains(itemId)) {
      return true;
    } else {
      return false;
    }
  }

  void clearErrorMessage() {
    _errorMessage = null;
    notifyListeners();
  }
}
