import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/enums/theme_enum.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/enums/language_enum.dart';

abstract class SettingsLocalStorage {
  void setTheme(ThemeEnum deviceTheme);
  void setLanguage(LangEnum deviceLang);
}

class SettingsLocalStorageImpl implements SettingsLocalStorage {
  SharedPreferences sharedPreferences;
  SettingsLocalStorageImpl(this.sharedPreferences);

  @override
  void setTheme(ThemeEnum deviceTheme) {
    if (deviceTheme == ThemeEnum.lightTheme) {
      sharedPreferences.setString(AppStrings.initTheme, AppStrings.lightTheme);
    } else if (deviceTheme == ThemeEnum.darkTheme) {
      sharedPreferences.setString(AppStrings.initTheme, AppStrings.darkTheme);
    } else {
      sharedPreferences.setString(AppStrings.initTheme, AppStrings.systemTheme);
    }
  }

  @override
  void setLanguage(LangEnum deviceLang) {
    if (deviceLang == LangEnum.englishLang) {
      sharedPreferences.setString(
          AppStrings.setLanguage, AppStrings.setEnglish);
    } else if (deviceLang == LangEnum.arabicLang) {
      sharedPreferences.setString(AppStrings.setLanguage, AppStrings.setArabic);
    } else {
      sharedPreferences.setString(
          AppStrings.setLanguage, AppStrings.setLanguage);
    }
  }
}
