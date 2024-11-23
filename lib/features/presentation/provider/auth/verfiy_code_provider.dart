import 'package:flutter/material.dart';

import '../../../domain/usecases/auth/verify_code_use_case.dart';

class VerfiyCodeProvider extends ChangeNotifier {
  final VerifyCodeUseCase verifyCodeUseCase;
  bool _isloading = false;
  String verfiyCode = "";
  String? _errorMessage;

  VerfiyCodeProvider(this.verifyCodeUseCase);

  bool get isLoading => _isloading;
  String? get errorMessage => _errorMessage;

  void setLoading(bool val) {
    _isloading = val;
    notifyListeners();
  }

  verfiyCodeWithEmail(BuildContext context) async {
    setLoading(true);
    // final result = await verifyCodeUseCase.call(user);
  }
}
