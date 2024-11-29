import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/enums/theme_enum.dart';
import '../../../provider/settings/theme_provider.dart';

class ThemeCard extends StatelessWidget {
  const ThemeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return Card(
      child: ListTile(
        leading: Icon(
            themeProvider.selectedTheme == ThemeEnum.lightTheme
                ? Icons.sunny
                : themeProvider.selectedTheme == ThemeEnum.darkTheme
                    ? Icons.dark_mode
                    : Icons.settings,
            size: 30),
        title: const Text("Theme", style: AppTextStyles.bold),
        subtitle: Text(themeProvider.selectedTheme == ThemeEnum.lightTheme
            ? "Light"
            : themeProvider.selectedTheme == ThemeEnum.darkTheme
                ? "Dark"
                : "System"),
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) =>
                ThemeSelectionSheet(themeProvider: themeProvider),
          );
        },
      ),
    );
  }
}

class ThemeSelectionSheet extends StatelessWidget {
  final ThemeProvider themeProvider;

  const ThemeSelectionSheet({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Select Theme", style: AppTextStyles.largeBold),
          const SizedBox(height: 20),
          ThemeOptions(
              themeProvider: themeProvider,
              context: context,
              theme: ThemeEnum.lightTheme,
              icon: Icons.light_mode,
              label: "Light Theme",
              isSelected: themeProvider.selectedTheme == ThemeEnum.lightTheme),
          ThemeOptions(
              themeProvider: themeProvider,
              context: context,
              theme: ThemeEnum.darkTheme,
              icon: Icons.dark_mode,
              label: "Dark Theme",
              isSelected: themeProvider.selectedTheme == ThemeEnum.darkTheme),
          ThemeOptions(
              themeProvider: themeProvider,
              context: context,
              theme: ThemeEnum.systemTheme,
              icon: Icons.settings,
              label: "System Default",
              isSelected: themeProvider.selectedTheme == ThemeEnum.systemTheme),
        ],
      ),
    );
  }
}

class ThemeOptions extends StatelessWidget {
  const ThemeOptions({
    super.key,
    required this.themeProvider,
    required this.context,
    required this.theme,
    required this.icon,
    required this.label,
    required this.isSelected,
  });

  final ThemeProvider themeProvider;
  final BuildContext context;
  final ThemeEnum theme;
  final IconData icon;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      trailing: isSelected
          ? const Icon(Icons.check, color: AppColors.primeColor)
          : null,
      onTap: () {
        themeProvider.setTheme(theme);
        context.pop();
      },
    );
  }
}
