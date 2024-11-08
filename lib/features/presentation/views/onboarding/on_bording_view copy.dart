import 'package:ecommerceapiapp/core/constants/app_assets.dart';
import 'package:ecommerceapiapp/core/enums/theme_enum.dart';
import 'package:ecommerceapiapp/core/functions/app_localize_hepler.dart';
import 'package:ecommerceapiapp/features/presentation/provider/settings/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/enums/language_enum.dart';
import '../../provider/settings/theme_provider.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});

  @override
  Widget build(BuildContext context) {
    final languageNotifier = Provider.of<LanguageProvider>(context);
    final themeNotifier = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(AppAssets.avatar),
            Text(translation(context).notesId),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    languageNotifier.setLanguage(LangEnum.englishLang);
                  },
                  child: Text("Switch to English"),
                ),
                TextButton(
                  onPressed: () {
                    languageNotifier.setLanguage(LangEnum.arabicLang);
                  },
                  child: Text("Switch to Arabic"),
                ),
                TextButton(
                  onPressed: () {
                    languageNotifier.setLanguage(LangEnum.systemLang);
                  },
                  child: Text("Switch to Default"),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    themeNotifier.setTheme(ThemeEnum.lightTheme);
                  },
                  child: Text("Switch to Light"),
                ),
                TextButton(
                  onPressed: () {
                    themeNotifier.setTheme(ThemeEnum.darkTheme);
                  },
                  child: Text("Switch to Dark"),
                ),
                TextButton(
                  onPressed: () {
                    themeNotifier.setTheme(ThemeEnum.systemTheme);
                  },
                  child: Text("Switch to Default"),
                ),
              ],
            ),
            Column(
              children: [
                DropdownButton<LangEnum>(
                  value: languageNotifier.selectedLanguage,
                  items: LangEnum.values.map((LangEnum lang) {
                    return DropdownMenuItem<LangEnum>(
                      value: lang,
                      child: Text(lang == LangEnum.englishLang
                          ? "English"
                          : lang == LangEnum.arabicLang
                              ? "Arabic"
                              : "System"),
                    );
                  }).toList(),
                  onChanged: (LangEnum? newLang) {
                    if (newLang != null) {
                      languageNotifier.setLanguage(newLang);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
