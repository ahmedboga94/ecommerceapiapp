import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/utils/app_routes.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text("Addresses", style: AppTextStyles.bold),
        subtitle: const Text("Manage your addresses"),
        leading: const Icon(Icons.location_on, size: 30),
        onTap: () => context.push(AppRoutes.addressView),
      ),
    );
  }
}
