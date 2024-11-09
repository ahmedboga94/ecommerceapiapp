import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/enums/language_enum.dart';
import '../../../provider/settings/language_provider.dart';

class LanguageToggleButtons extends StatelessWidget {
  const LanguageToggleButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return ToggleButtons(
      fillColor: AppColors.primeColor,
      selectedColor: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(8),
      selectedBorderColor: AppColors.primeColor,
      constraints: const BoxConstraints(minWidth: 100, minHeight: 40),
      isSelected: [
        languageProvider.selectedLanguage == LangEnum.englishLang,
        languageProvider.selectedLanguage == LangEnum.systemLang,
        languageProvider.selectedLanguage == LangEnum.arabicLang,
      ],
      onPressed: (index) {
        switch (index) {
          case 0:
            languageProvider.setLanguage(LangEnum.englishLang);
            break;
          case 1:
            languageProvider.setLanguage(LangEnum.systemLang);
            break;
          case 2:
            languageProvider.setLanguage(LangEnum.arabicLang);
            break;
        }
      },
      children: const [
        Padding(padding: EdgeInsets.all(12), child: Text("ENG")),
        Padding(padding: EdgeInsets.all(12), child: Text("System")),
        Padding(padding: EdgeInsets.all(12), child: Text("ARA")),
      ],
    );
  }
}
