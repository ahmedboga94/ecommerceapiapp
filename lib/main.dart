import 'package:ecommerceapiapp/core/di/init_di.dart';
import 'package:ecommerceapiapp/core/utils/app_theme.dart';
import 'package:ecommerceapiapp/features/presentation/provider/profile/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'core/functions/custom_status_nav_bar_func.dart';
import 'core/utils/app_routes.dart';
import 'features/presentation/provider/profile/language_provider.dart';

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
        ChangeNotifierProvider(create: (_) => di<ThemeProvider>()),
        ChangeNotifierProvider(create: (_) => di<LanguageProvider>()),
      ],
      child: Consumer2<ThemeProvider, LanguageProvider>(
        builder: (context, theme, lang, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: "E-Commerce App",
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: theme.choosingTheme(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: lang.choosingLanguage(),
            routerConfig: AppRoutes.router,
          );
        },
      ),
    );
  }
}
