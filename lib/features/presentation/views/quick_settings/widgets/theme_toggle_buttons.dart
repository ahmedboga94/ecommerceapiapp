import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/enums/theme_enum.dart';
import '../../../provider/settings/theme_provider.dart';

class ThemeToggleButtons extends StatelessWidget {
  const ThemeToggleButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ToggleButtons(
      fillColor: AppColors.primeColor,
      selectedColor: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(8),
      selectedBorderColor: AppColors.primeColor,
      constraints: const BoxConstraints(minWidth: 100, minHeight: 40),
      isSelected: [
        themeProvider.selectedTheme == ThemeEnum.lightTheme,
        themeProvider.selectedTheme == ThemeEnum.systemTheme,
        themeProvider.selectedTheme == ThemeEnum.darkTheme,
      ],
      onPressed: (index) {
        switch (index) {
          case 0:
            themeProvider.setTheme(ThemeEnum.lightTheme);
            break;
          case 1:
            themeProvider.setTheme(ThemeEnum.systemTheme);
            break;
          case 2:
            themeProvider.setTheme(ThemeEnum.darkTheme);
            break;
        }
      },
      children: const [
        Padding(padding: EdgeInsets.all(12), child: Icon(Icons.sunny)),
        Padding(padding: EdgeInsets.all(12), child: Icon(Icons.phone_android)),
        Padding(padding: EdgeInsets.all(12), child: Icon(Icons.dark_mode)),
      ],
    );
  }
}
