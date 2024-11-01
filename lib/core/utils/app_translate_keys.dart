import 'package:flutter/material.dart';
import '../functions/app_localize_hepler.dart';

extension AppTranslateKeys on BuildContext {
  //Notes
  String get notesKey => translation(this).notesId;
}
