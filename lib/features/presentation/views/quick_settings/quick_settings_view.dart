import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/app_routes.dart';
import 'widgets/language_toggle_buttons.dart';
import 'widgets/theme_toggle_buttons.dart';

class QuickSettingsView extends StatelessWidget {
  const QuickSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 2),
            SizedBox(height: 240, child: SvgPicture.asset(AppAssets.welcoming)),
            const Spacer(),
            const Text("Choose Your Favourite Language",
                style: AppTextStyles.mediumRegular),
            const SizedBox(height: 10),
            const Center(child: LanguageToggleButtons()),
            const SizedBox(height: 50),
            const Text("Choose Your Favourite Theme",
                style: AppTextStyles.mediumRegular),
            const SizedBox(height: 10),
            const Center(child: ThemeToggleButtons()),
            const Spacer(flex: 4),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => context.push(AppRoutes.onBordingView),
                  child: const Text("Let's Go",
                      style: AppTextStyles.mediumRegular)),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
