import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/functions/show_snack_bar.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/auth/reset_password_use_case.dart';

class ResetPasswordProvider extends ChangeNotifier {
  final ResetPasswordUseCase resetPasswordUseCase;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp _regexPassword = RegExp(AppStrings.passwordValidate);
  bool _isloading = false;
  String password = "";
  String confirmPassword = "";
  bool _isPassVisible = true;
  bool _isConfirmPassVisible = true;

  ResetPasswordProvider(this.resetPasswordUseCase);

  GlobalKey<FormState> get formKey => _formKey;
  bool get isLoading => _isloading;
  bool get isPassVisible => _isPassVisible;
  bool get isConfirmPassVisible => _isConfirmPassVisible;

  void _setLoading(bool val) {
    _isloading = val;
    notifyListeners();
  }

  changeAndConfirmPass(BuildContext context,
      {required String mail, required String msg}) async {
    if (_formKey.currentState!.validate()) {
      _setLoading(true);

      UserEntity user = UserEntity(email: mail, password: password);

      final result = await resetPasswordUseCase.call(user);
      result.fold(
        (failure) {
          debugPrint("============ ${failure.message} ============");
          showSnackBar(context, msg: failure.message);
          notifyListeners();
        },
        (response) {
          debugPrint("============ ${response["status"]} ============");
          context.go(AppRoutes.loginView);
          showSnackBar(context, msg: msg, icon: Icons.check_circle_outline);
          notifyListeners();
        },
      );

      _setLoading(false);
    }
  }

  String? passwordValidator(
    String value, {
    required String hintPass,
    required String hintVaildPassword,
  }) {
    if (value.isEmpty) {
      return hintPass;
    }
    if (!_regexPassword.hasMatch(value)) {
      return hintVaildPassword;
    }
    return null;
  }

  String? passwordConfirmValidator(
    String value, {
    required String hintPass,
    required String hintNotMatch,
  }) {
    if (value.isEmpty) {
      return hintPass;
    }
    if (value != password) {
      return hintNotMatch;
    }
    return null;
  }

  void visiblePassword() {
    _isPassVisible = !_isPassVisible;
    notifyListeners();
  }

  void visibleConfirmPassword() {
    _isConfirmPassVisible = !_isConfirmPassVisible;
    notifyListeners();
  }
}
