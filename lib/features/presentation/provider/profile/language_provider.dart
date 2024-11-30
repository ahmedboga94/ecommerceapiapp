import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/di/init_di.dart';
import '../../../../core/enums/language_enum.dart';
import '../../../domain/usecases/profile/set_language_use_case.dart';

class LanguageProvider extends ChangeNotifier {
  final SetLanguageUseCase setLanguageUseCase;
  LangEnum _selectedLanguage = LangEnum.systemLang;
  String? _errorMessage;
  String? _langKey;

  LanguageProvider(this.setLanguageUseCase) {
    loadLanguage();
  }

  LangEnum get selectedLanguage => _selectedLanguage;
  String? get errorMessage => _errorMessage;
  String? get langKey => _langKey;

  void loadLanguage() {
    _langKey = di<SharedPreferences>().getString(AppStrings.setLanguage);

    switch (_langKey) {
      case AppStrings.setEnglish:
        _selectedLanguage = LangEnum.englishLang;
      case AppStrings.setArabic:
        _selectedLanguage = LangEnum.arabicLang;
      default:
        _selectedLanguage = LangEnum.systemLang;
    }
    notifyListeners();
  }

  void setLanguage(LangEnum lang) {
    _selectedLanguage = lang;
    final result = setLanguageUseCase.call(lang);
    result.fold(
      (failure) {
        _errorMessage = failure.message;
        notifyListeners();
      },
      (_) {
        debugPrint("$_selectedLanguage");
        notifyListeners();
      },
    );
  }

  Locale? choosingLanguage() {
    switch (_selectedLanguage) {
      case LangEnum.englishLang:
        return const Locale(AppStrings.setEnglish);
      case LangEnum.arabicLang:
        return const Locale(AppStrings.setArabic);
      default:
        return null;
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
