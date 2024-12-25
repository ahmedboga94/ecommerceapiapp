import 'package:flutter/material.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../domain/entities/item_entity.dart';
import '../../../domain/usecases/home/get_categories_use_case.dart';
import '../../../domain/usecases/home/get_discount_items_use_case.dart';

class HomeProvider extends ChangeNotifier {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetDiscountItemsUseCase getDiscountItemsUseCase;
  List<CategoryEntity> _categoriesList = [];
  List<ItemEntity> _itemsList = [];
  bool _isloading = false;
  String? _errorMessage;

  HomeProvider({
    required this.getCategoriesUseCase,
    required this.getDiscountItemsUseCase,
  }) {
    getGategories();
    getDiscountItems();
  }

  List<CategoryEntity> get categoriesList => _categoriesList;
  List<ItemEntity> get itemsList => _itemsList;
  bool get isLoading => _isloading;
  String? get errorMessage => _errorMessage;

  void _setLoading(bool val) {
    _isloading = val;
    notifyListeners();
  }

  getGategories() async {
    _setLoading(true);
    final result = await getCategoriesUseCase.call();
    result.fold(
      (failure) {
        debugPrint("============ ${failure.message} ============");
        _errorMessage = failure.message;
      },
      (response) {
        debugPrint("============ success categories ============");
        _categoriesList = response;
        notifyListeners();
      },
    );
    _setLoading(false);
  }

  getDiscountItems() async {
    _setLoading(true);
    final result = await getDiscountItemsUseCase.call();
    result.fold(
      (failure) {
        debugPrint("============ ${failure.message} ============");
      },
      (response) {
        debugPrint("============ success items ============");
        _itemsList = response;
      },
    );
    _setLoading(false);
  }

  Future<void> refreshHome() async {
    getGategories();
    getDiscountItems();
  }

  void clearErrorMessage() {
    _errorMessage = null;
    notifyListeners();
  }
}
