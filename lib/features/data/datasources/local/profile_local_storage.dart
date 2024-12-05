import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/enums/theme_enum.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/enums/language_enum.dart';
import '../../models/user_model.dart';

abstract class ProfileLocalStorage {
  void setTheme(ThemeEnum deviceTheme);
  void setLanguage(LangEnum deviceLang);
  UserModel? getUserData();
  Future<void> saveUserData(Map<String, dynamic> userData);
  Future<void> clearUserData();
}

class ProfileLocalStorageImpl implements ProfileLocalStorage {
  SharedPreferences sharedPref;
  ProfileLocalStorageImpl(this.sharedPref);

  @override
  void setTheme(ThemeEnum deviceTheme) {
    if (deviceTheme == ThemeEnum.lightTheme) {
      sharedPref.setString(AppStrings.initTheme, AppStrings.lightTheme);
    } else if (deviceTheme == ThemeEnum.darkTheme) {
      sharedPref.setString(AppStrings.initTheme, AppStrings.darkTheme);
    } else {
      sharedPref.setString(AppStrings.initTheme, AppStrings.systemTheme);
    }
  }

  @override
  void setLanguage(LangEnum deviceLang) {
    if (deviceLang == LangEnum.englishLang) {
      sharedPref.setString(AppStrings.setLanguage, AppStrings.setEnglish);
    } else if (deviceLang == LangEnum.arabicLang) {
      sharedPref.setString(AppStrings.setLanguage, AppStrings.setArabic);
    } else {
      sharedPref.setString(AppStrings.setLanguage, AppStrings.setLanguage);
    }
  }

  @override
  Future<void> saveUserData(Map<String, dynamic> userData) async {
    await sharedPref.setString(AppStrings.userData, jsonEncode(userData));
  }

  @override
  UserModel? getUserData() {
    final dataString = sharedPref.getString(AppStrings.userData);
    if (dataString != null) {
      final userJson = json.decode(dataString);
      return UserModel.fromJson(userJson);
    }
    return null;
  }

  @override
  Future<void> clearUserData() async {
    await Future.wait([
      sharedPref.remove(AppStrings.userData),
      sharedPref.setBool(AppStrings.mainPage, false),
    ]);
  }
}
