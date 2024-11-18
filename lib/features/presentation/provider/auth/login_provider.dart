import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';

class LoginProvider extends ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final RegExp _regexMail = RegExp(AppStrings.mailValidate);
  bool _isloading = false;
  bool _isPassVisible = true;

  GlobalKey<FormState> get formKey => _formKey;
  bool get isLoading => _isloading;
  bool get isPassVisible => _isPassVisible;

  void setLoading(bool val) {
    _isloading = val;
    notifyListeners();
  }

  loginWithEmailandPassword() async {
    if (_formKey.currentState!.validate()) {
      setLoading(true);
      //Login func

      await Future.delayed(const Duration(seconds: 3));
      print("Done");

      setLoading(false);
      // notifyListeners();
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
}
