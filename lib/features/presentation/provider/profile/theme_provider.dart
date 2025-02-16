import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/di/init_di.dart';
import '../../../../core/enums/theme_enum.dart';
import '../../../domain/usecases/profile/set_theme_use_case.dart';

class ThemeProvider extends ChangeNotifier {
  final SetThemeUseCase setThemeUseCase;
  ThemeEnum _selectedTheme = ThemeEnum.systemTheme;
  String? _errorMessage;
  String? _themeKey;

  ThemeProvider(this.setThemeUseCase) {
    loadTheme();
  }

  ThemeEnum get selectedTheme => _selectedTheme;
  String? get errorMessage => _errorMessage;
  String? get themeKey => _themeKey;

  loadTheme() {
    _themeKey = di<SharedPreferences>().getString(AppStrings.initTheme);

    switch (_themeKey) {
      case AppStrings.lightTheme:
        _selectedTheme = ThemeEnum.lightTheme;
      case AppStrings.darkTheme:
        _selectedTheme = ThemeEnum.darkTheme;
      default:
        _selectedTheme = ThemeEnum.systemTheme;
    }
    notifyListeners();
  }

  void setTheme(ThemeEnum theme) {
    _selectedTheme = theme;
    final result = setThemeUseCase.call(theme);
    result.fold(
      (failure) {
        _errorMessage = failure.message;
        notifyListeners();
      },
      (_) {
        debugPrint("$_selectedTheme");
        notifyListeners();
      },
    );
  }

  ThemeMode choosingTheme() {
    switch (_selectedTheme) {
      case ThemeEnum.lightTheme:
        return ThemeMode.light;
      case ThemeEnum.darkTheme:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
