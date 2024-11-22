import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/auth/sign_up_use_case.dart';

class SignUpProvider extends ChangeNotifier {
  final SignUpUseCase signUpUseCase;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final RegExp _regexMail = RegExp(AppStrings.mailValidate);
  final RegExp _regexPassword = RegExp(AppStrings.passwordValidate);
  bool _isloading = false;
  String userName = "";
  String email = "";
  String phoneNumber = "";
  String password = "";
  String confirmPassword = "";
  bool _isPassVisible = true;
  bool _isConfirmPassVisible = true;
  String? _errorMessage;

  SignUpProvider(this.signUpUseCase);

  GlobalKey<FormState> get formKey => _formKey;
  bool get isLoading => _isloading;
  bool get isPassVisible => _isPassVisible;
  bool get isConfirmPassVisible => _isConfirmPassVisible;
  String? get errorMessage => _errorMessage;

  void setLoading(bool val) {
    _isloading = val;
    notifyListeners();
  }

  signUpWithEmailandPassword() async {
    if (_formKey.currentState!.validate()) {
      setLoading(true);

      UserEntity user = UserEntity(
          userName: userName,
          email: email,
          phoneNumber: phoneNumber,
          password: password);

      final result = await signUpUseCase.call(user);
      result.fold(
        (failure) {
          _errorMessage = failure.message;
          debugPrint(" ========= ${failure.message}");

          notifyListeners();
        },
        (response) {
          print("============ ${response["status"]}");
          notifyListeners();
        },
      );

      setLoading(false);
    }
  }

  String? nameValidator(
    String value, {
    required String hintUserName,
    required String nameLength6Hint,
  }) {
    if (value.isEmpty) {
      return hintUserName;
    }
    if (value.length < 6) {
      return nameLength6Hint;
    }
    return null;
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

  String? phoneNumberValidator(
    String value, {
    required String hintPhoneNumber,
    required String nameLength10Hint,
  }) {
    if (value.isEmpty) {
      return hintPhoneNumber;
    }
    if (value.length < 10) {
      return nameLength10Hint;
    }
    return null;
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

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
