import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/utils/app_routes.dart';

class ContactUsCard extends StatelessWidget {
  const ContactUsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text("Contact Us", style: AppTextStyles.bold),
        subtitle: const Text("Contact us for any queries"),
        leading: const Icon(Icons.call, size: 30),
        onTap: () => context.push(AppRoutes.favoritesView),
      ),
    );
  }
}
