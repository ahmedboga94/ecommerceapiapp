import 'package:flutter/material.dart';
import '../../../domain/entities/item_entity.dart';
import '../../../domain/usecases/profile/get_user_favorite_items_use_case.dart';

class FavoriteProvider extends ChangeNotifier {
  final GetUserFavoriteItemsUseCase getUserFavoriteItemsUseCase;

  List<ItemEntity> _itemsList = [];
  bool _isloading = false;
  String? _errorMessage;

  FavoriteProvider(this.getUserFavoriteItemsUseCase) {
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
    final result = await getUserFavoriteItemsUseCase.call();
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
}
