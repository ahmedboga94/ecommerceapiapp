import 'package:flutter/material.dart';
import '../functions/app_localize_hepler.dart';

extension AppTranslateKeys on BuildContext {
  //Quick Settings
  String get chooseFavLangKey => translation(this).chooseFavLangId;
  String get chooseFavThemeKey => translation(this).chooseFavThemeId;
  String get letsGoKey => translation(this).letsGoId;
  String get englishKey => translation(this).englishId;
  String get arabicKey => translation(this).arabicId;
  String get systemKey => translation(this).systemId;
}
