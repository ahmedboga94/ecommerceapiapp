import 'package:ecommerceapiapp/core/di/init_di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_strings.dart';
import 'core/utils/app_routes.dart';
import 'features/presentation/provider/settings/language_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => di<LanguageProvider>()..loadLanguage()),
      ],
      child: Consumer<LanguageProvider>(
        builder: (context, lang, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: "E-Commerce App",
            // theme: AppThemes.lightTheme,
            // darkTheme: AppThemes.darkTheme,
            // themeMode: theme is LightThemeState
            //     ? ThemeMode.light
            //     : theme is DarkThemeState
            //         ? ThemeMode.dark
            //         : ThemeMode.system,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            // locale: lang is EnglishLangState
            //     ? const Locale(AppStrings.setEnglish)
            //     : lang is ArabicLangState
            //         ? const Locale(AppStrings.setArabic)
            //         : null,
            routerConfig: AppRoutes.router,
          );
        },
      ),
    );
  }
}
