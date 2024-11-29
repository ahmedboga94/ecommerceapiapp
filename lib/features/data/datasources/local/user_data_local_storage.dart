import 'dart:convert';

import 'package:ecommerceapiapp/core/constants/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';

abstract class UserDataLocalStorage {
  Future<UserModel?> getUserData();
  Future<void> saveUserData(Map<String, dynamic> userData);
  Future<void> clearUserData();
}

class UserDataLocalStorageImpl implements UserDataLocalStorage {
  final SharedPreferences sharedPref;

  UserDataLocalStorageImpl(this.sharedPref);

  @override
  Future<UserModel?> getUserData() async {
    final dataString = sharedPref.getString(AppStrings.userData);
    if (dataString != null) {
      final userJson = json.decode(dataString);
      return UserModel.fromJson(userJson);
    }
    return null;
  }

  @override
  Future<void> saveUserData(Map<String, dynamic> userData) async {
    await sharedPref.setString(AppStrings.userData, jsonEncode(userData));
  }

  @override
  Future<void> clearUserData() async {
    await sharedPref.remove(AppStrings.userData);
    sharedPref.setBool("mainView", false);
  }
}
