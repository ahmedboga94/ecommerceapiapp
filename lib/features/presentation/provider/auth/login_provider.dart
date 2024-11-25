import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/functions/show_snack_bar.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/auth/login_use_case.dart';

class LoginProvider extends ChangeNotifier {
  final LoginUseCase loginUseCase;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final RegExp _regexMail = RegExp(AppStrings.mailValidate);
  String email = "";
  String password = "";
  bool _isloading = false;
  bool _isPassVisible = true;
  String? _errorMessage;

  LoginProvider(this.loginUseCase);

  GlobalKey<FormState> get formKey => _formKey;
  bool get isLoading => _isloading;
  bool get isPassVisible => _isPassVisible;
  String? get errorMessage => _errorMessage;

  void setLoading(bool val) {
    _isloading = val;
    notifyListeners();
  }

  loginWithEmailandPassword(BuildContext context, {required String msg}) async {
    if (_formKey.currentState!.validate()) {
      setLoading(true);
      UserEntity user = UserEntity(email: email, password: password);

      final result = await loginUseCase.call(user);
      result.fold(
        (failure) {
          debugPrint("============ ${failure.message} ============");
          _errorMessage = failure.message;
          // notifyListeners();
        },
        (response) {
          debugPrint("============ ${response["status"]} ============");
          showSnackBar(context, msg: msg, icon: Icons.check_circle_outline);
          context.push(AppRoutes.mainView, extra: email);
          // notifyListeners();
        },
      );

      setLoading(false);
    }
  }

  String? emailValidator(
    String value, {
    required String hintEmail,
    required String hintVaildEmail,
  }) {
    if (value.isEmpty) {
      return hintEmail;
    }
    if (!_regexMail.hasMatch(value)) {
      return hintVaildEmail;
    }
    return null;
  }

  String? passwordValidator(String value, {required String hintPass}) {
    if (value.isEmpty) {
      return hintPass;
    }
    return null;
  }

  void visiblePassword() {
    _isPassVisible = !_isPassVisible;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
