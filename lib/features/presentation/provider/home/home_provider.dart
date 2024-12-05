import 'package:flutter/material.dart';
import '../../../domain/usecases/home/get_categories_use_case.dart';

class HomeProvider extends ChangeNotifier {
  final GetCategoriesUseCase getCategoriesUseCase;
  bool _isloading = false;

  HomeProvider({required this.getCategoriesUseCase}) {
    getGategories();
  }
  bool get isLoading => _isloading;

  void setLoading(bool val) {
    _isloading = val;
    notifyListeners();
  }

  getGategories() async {
    setLoading(true);

    final result = await getCategoriesUseCase.call();
    result.fold(
      (failure) {
        debugPrint("============ ${failure.message} ============");
      },
      (response) {
        debugPrint("============ $response ============");
      },
    );

    setLoading(false);
  }
}
