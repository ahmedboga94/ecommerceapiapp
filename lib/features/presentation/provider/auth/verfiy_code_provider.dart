import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/functions/show_snack_bar.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/auth/verify_code_use_case.dart';

class VerfiyCodeProvider extends ChangeNotifier {
  final VerifyCodeUseCase verifyCodeUseCase;
  bool _isloading = false;
  String? _errorMessage;

  VerfiyCodeProvider(this.verifyCodeUseCase);

  bool get isLoading => _isloading;
  String? get errorMessage => _errorMessage;

  void _setLoading(bool val) {
    _isloading = val;
    notifyListeners();
  }

  verfiyCodeWithEmail(BuildContext context,
      {required String email,
      required String verfiyCode,
      required String msg}) async {
    _setLoading(true);
    final user = UserEntity(email: email, verfiyCode: verfiyCode);
    final result = await verifyCodeUseCase.call(user);
    result.fold(
      (failure) {
        debugPrint("============ ${failure.message} ============");
        _errorMessage = failure.message;
        notifyListeners();
      },
      (response) {
        debugPrint("============ ${response["status"]} ============");
        showSnackBar(context, msg: msg, icon: Icons.check_circle_outline);
        context.go(AppRoutes.loginView);
        notifyListeners();
      },
    );
    _setLoading(false);
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
