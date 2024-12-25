import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/utils/app_routes.dart';

class FavoritesCard extends StatelessWidget {
  const FavoritesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text("Favorites", style: AppTextStyles.bold),
        subtitle: const Text("View your favorite items"),
        leading: const Icon(Icons.favorite, size: 30),
        onTap: () => context.push(AppRoutes.favoritesView),
      ),
    );
  }
}
