import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/functions/show_snack_bar.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/auth/forget_password_use_case.dart';

class ForgetPasswordProvider extends ChangeNotifier {
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp _regexMail = RegExp(AppStrings.mailValidate);
  bool _isloading = false;
  String email = "";

  ForgetPasswordProvider(this.forgetPasswordUseCase);

  GlobalKey<FormState> get formKey => _formKey;
  bool get isLoading => _isloading;

  void _setLoading(bool val) {
    _isloading = val;
    notifyListeners();
  }

  forgetPassword(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _setLoading(true);

      UserEntity user = UserEntity(email: email);

      final result = await forgetPasswordUseCase.call(user);
      result.fold(
        (failure) {
          debugPrint("============ ${failure.message} ============");
          showSnackBar(context, msg: failure.message);
          notifyListeners();
        },
        (response) {
          debugPrint("============ ${response["status"]} ============");
          context.push(AppRoutes.resetPasswordVerfiyView, extra: email);
          notifyListeners();
        },
      );

      _setLoading(false);
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
}
