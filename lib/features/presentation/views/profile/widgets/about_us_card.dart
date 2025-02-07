import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/utils/app_routes.dart';

class AboutUsCard extends StatelessWidget {
  const AboutUsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text("About Us", style: AppTextStyles.bold),
        subtitle: const Text("Learn more about us"),
        leading: const Icon(Icons.info_outline, size: 30),
        onTap: () => context.push(AppRoutes.favoritesView),
      ),
    );
  }
}
