import 'package:ecommerceapiapp/core/enums/language_enum.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../provider/settings/language_provider.dart';

class LangCard extends StatelessWidget {
  const LangCard({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguageProvider>();
    return Card(
      child: ListTile(
        leading: const Icon(Icons.language_outlined, size: 30),
        title: const Text("Language", style: AppTextStyles.bold),
        subtitle: Text(
          languageProvider.selectedLanguage == LangEnum.arabicLang
              ? "Arabic"
              : languageProvider.selectedLanguage == LangEnum.englishLang
                  ? "English"
                  : "System",
        ),
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) =>
                LanguageSelectionSheet(languageProvider: languageProvider),
          );
        },
      ),
    );
  }
}

class LanguageSelectionSheet extends StatelessWidget {
  final LanguageProvider languageProvider;
  const LanguageSelectionSheet({super.key, required this.languageProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Select Language", style: AppTextStyles.largeBold),
          const SizedBox(height: 20),
          LanguageOptions(
              context: context,
              languageProvider: languageProvider,
              lang: LangEnum.englishLang,
              icon: Icons.language_outlined,
              label: "English",
              isSelected:
                  languageProvider.selectedLanguage == LangEnum.englishLang),
          LanguageOptions(
              context: context,
              languageProvider: languageProvider,
              lang: LangEnum.arabicLang,
              icon: Icons.language_rounded,
              label: "Arabic",
              isSelected:
                  languageProvider.selectedLanguage == LangEnum.arabicLang),
          LanguageOptions(
              context: context,
              languageProvider: languageProvider,
              lang: LangEnum.systemLang,
              icon: Icons.settings,
              label: "System Default",
              isSelected:
                  languageProvider.selectedLanguage == LangEnum.systemLang),
        ],
      ),
    );
  }
}

class LanguageOptions extends StatelessWidget {
  final BuildContext context;
  final LanguageProvider languageProvider;
  final LangEnum lang;
  final IconData icon;
  final String label;
  final bool isSelected;

  const LanguageOptions({
    super.key,
    required this.context,
    required this.languageProvider,
    required this.lang,
    required this.icon,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      trailing: isSelected
          ? const Icon(Icons.check, color: AppColors.primeColor)
          : null,
      onTap: () {
        languageProvider.setLanguage(lang);
        context.pop();
      },
    );
  }
}
