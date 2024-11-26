import 'package:ecommerceapiapp/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/functions/show_snack_bar.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/auth/reset_password_verfiy_use_case.dart';

class ResetPasswordVerfiyProvider extends ChangeNotifier {
  final ResetPasswordVerfiyUseCase resetPasswordVerfiyUseCase;
  bool _isloading = false;

  ResetPasswordVerfiyProvider(this.resetPasswordVerfiyUseCase);

  bool get isLoading => _isloading;

  void _setLoading(bool val) {
    _isloading = val;
    notifyListeners();
  }

  resetPassWithCode(BuildContext context,
      {required String email, required String verfiyCode}) async {
    _setLoading(true);
    final user = UserEntity(email: email, verfiyCode: verfiyCode);
    final result = await resetPasswordVerfiyUseCase.call(user);
    result.fold(
      (failure) {
        debugPrint("============ ${failure.message} ============");
        showSnackBar(context, msg: failure.message);
        notifyListeners();
      },
      (response) {
        debugPrint("============ ${response["status"]} ============");
        context.push(AppRoutes.resetPasswordSccuessView, extra: email);
        notifyListeners();
      },
    );
    _setLoading(false);
  }
}
