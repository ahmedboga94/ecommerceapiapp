import 'package:flutter/material.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../domain/entities/item_entity.dart';
import '../../../domain/usecases/home/get_category_items_use_case.dart';

class CategoryItemsProvider extends ChangeNotifier {
  final GetCategoryItemsUseCase getCategoryItemsUseCase;
  final CategoryEntity selectedCategory;
  List<ItemEntity> _itemsList = [];

  bool _isloading = false;

  CategoryItemsProvider({
    required this.getCategoryItemsUseCase,
    required this.selectedCategory,
  }) {
    getGategoryItems();
  }

  List<ItemEntity> get itemsList => _itemsList;
  bool get isLoading => _isloading;

  void _setLoading(bool val) {
    _isloading = val;
    notifyListeners();
  }

  getGategoryItems() async {
    _setLoading(true);
    final result = await getCategoryItemsUseCase.call(selectedCategory);
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
}
