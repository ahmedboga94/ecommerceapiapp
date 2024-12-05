import 'package:flutter/material.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../domain/usecases/home/get_categories_use_case.dart';

class HomeProvider extends ChangeNotifier {
  final GetCategoriesUseCase getCategoriesUseCase;
  List<CategoryEntity> _categories = [];
  bool _isloading = false;

  HomeProvider({required this.getCategoriesUseCase}) {
    getGategories();
  }

  List<CategoryEntity> get categories => _categories;
  bool get isLoading => _isloading;

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
      },
      (response) {
        debugPrint("============ sucess categories ============");
        _categories = response;
      },
    );

    _setLoading(false);
  }
}
