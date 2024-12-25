import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

import '../constants/app_strings.dart';
import '../di/init_di.dart';

String translateDatabase(String englishLang, String arabicLang) {
  String? langKey = di<SharedPreferences>().getString(AppStrings.setLanguage);
  final systemLang = PlatformDispatcher.instance.locale.languageCode;

  switch (langKey) {
    case AppStrings.setEnglish:
      return englishLang;
    case AppStrings.setArabic:
      return arabicLang;
    default:
      return systemLang == AppStrings.setEnglish ? englishLang : arabicLang;
  }
}

bool isLanguage() {
  String? langKey = di<SharedPreferences>().getString(AppStrings.setLanguage);
  final systemLang = PlatformDispatcher.instance.locale.languageCode;

  switch (langKey) {
    case AppStrings.setEnglish:
      return true;
    case AppStrings.setArabic:
      return false;
    default:
      return systemLang == AppStrings.setEnglish ? true : false;
  }
}
