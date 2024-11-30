import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/functions/show_snack_bar.dart';
import '../../../../core/utils/app_routes.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/profile/clear_user_data_use_case.dart';
import '../../../domain/usecases/profile/get_user_data_use_case.dart';

class ProfileProvider extends ChangeNotifier {
  final GetUserDataUseCase getUserDataUseCase;
  final ClearUserDataUseCase clearUserDataUseCase;
  UserEntity? _userEntity;
  bool _isloading = false;

  ProfileProvider({
    required this.getUserDataUseCase,
    required this.clearUserDataUseCase,
  }) {
    getUserData();
  }

  UserEntity? get userEntity => _userEntity;
  bool get isLoading => _isloading;

  void setLoading(bool val) {
    _isloading = val;
    notifyListeners();
  }

  void getUserData() async {
    setLoading(true);
    final result = getUserDataUseCase.call();

    result.fold(
      (failure) {
        failure.message;
      },
      (user) {
        _userEntity = user;
      },
    );

    setLoading(false);
  }

  void logOut(BuildContext context, {required String msg}) {
    final result = getUserDataUseCase.call();
    result.fold(
      (failure) {
        failure.message;
        notifyListeners();
      },
      (_) {
        showSnackBar(context, msg: msg);
        context.go(AppRoutes.loginView);
        notifyListeners();
      },
    );
  }
}
