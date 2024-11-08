import 'package:ecommerceapiapp/core/di/init_di.dart';
import 'package:ecommerceapiapp/core/enums/language_enum.dart';
import 'package:ecommerceapiapp/core/enums/theme_enum.dart';
import 'package:ecommerceapiapp/core/utils/app_theme.dart';
import 'package:ecommerceapiapp/features/presentation/provider/settings/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_strings.dart';
import 'core/functions/custom_status_nav_bar_func.dart';
import 'core/utils/app_routes.dart';
import 'features/presentation/provider/settings/language_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi();
  customStatusBarAndNavigationBar();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => di<ThemeProvider>()..loadTheme()),
        ChangeNotifierProvider(
            create: (_) => di<LanguageProvider>()..loadLanguage()),
      ],
      child: Consumer2<ThemeProvider, LanguageProvider>(
        builder: (context, theme, lang, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: "E-Commerce App",
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: theme.selectedTheme == ThemeEnum.lightTheme
                ? ThemeMode.light
                : theme.selectedTheme == ThemeEnum.darkTheme
                    ? ThemeMode.dark
                    : ThemeMode.system,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: lang.selectedLanguage == LangEnum.englishLang
                ? const Locale(AppStrings.setEnglish)
                : lang.selectedLanguage == LangEnum.arabicLang
                    ? const Locale(AppStrings.setArabic)
                    : null,
            routerConfig: AppRoutes.router,
          );
        },
      ),
    );
  }
}
