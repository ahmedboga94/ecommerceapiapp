import 'package:ecommerceapiapp/features/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../data/datasources/local/user_data_local_storage.dart';
import '../../../domain/entities/user_entity.dart';

class ProfileProvider extends ChangeNotifier {
  final UserDataLocalStorage userDataLocalStorage;
  UserEntity? _userEntity;
  bool _isloading = false;

  ProfileProvider(this.userDataLocalStorage) {
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
    UserModel? user = await userDataLocalStorage.getUserData();

    _userEntity = UserEntity(
      id: user!.id,
      userName: user.userName,
      email: user.email,
      phoneNumber: user.phoneNumber,
      createdAt: user.createdAt,
    );

    setLoading(false);
  }

  void logOut(BuildContext context) {
    userDataLocalStorage.clearUserData();
    context.go(AppRoutes.loginView);
  }
}
