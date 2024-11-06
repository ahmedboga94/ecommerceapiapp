import 'package:flutter/material.dart';

import '../../../../core/enums/language_enum.dart';
import '../../../domain/usecases/settings/get_language_use_case.dart';
import '../../../domain/usecases/settings/save_language_use_case.dart';

class LanguageProvider extends ChangeNotifier {
  final GetLanguageUseCase getLanguageUseCase;
  final SaveLanguageUseCase saveLanguageUseCase;
  LangEnum _selectedLanguage = LangEnum.systemLang;
  String? _errorMessage;

  LanguageProvider(
      {required this.saveLanguageUseCase, required this.getLanguageUseCase});

  LangEnum get selectedLanguage => _selectedLanguage;
  String? get errorMessage => _errorMessage;

  Future<void> loadLanguage() async {
    final result = await getLanguageUseCase.call();
    result.fold(
      (failure) {
        _errorMessage = failure.message;
        notifyListeners();
      },
      (lang) {
        _selectedLanguage = lang;
        notifyListeners();
      },
    );
  }

  Future<void> updateLanguage(LangEnum lang) async {
    _selectedLanguage = lang;
    final result = await saveLanguageUseCase.call(lang);
    result.fold(
      (failure) {
        _errorMessage = failure.message;
        notifyListeners();
      },
      (_) => notifyListeners(),
    );
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
