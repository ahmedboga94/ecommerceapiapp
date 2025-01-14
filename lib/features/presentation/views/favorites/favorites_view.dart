import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/di/init_di.dart';
import '../../../../core/functions/show_snack_bar.dart';
import '../../../../core/utils/app_routes.dart';
import '../../provider/profile/favorite_provider.dart';
import 'widgets/fav_item_card.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => di<FavoriteProvider>(),
      child: Consumer<FavoriteProvider>(
        builder: (context, favoriteProvider, child) {
          return Scaffold(
            appBar: AppBar(title: const Text("Favorites")),
            body: favoriteProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : favoriteProvider.itemsList.isEmpty
                    ? const Center(child: Text("No Items Here"))
                    : ListView.builder(
                        itemCount: favoriteProvider.itemsList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => context.push(AppRoutes.itemDetails,
                                extra: favoriteProvider.itemsList[index]),
                            child: FavItemCard(
                              itemEntity: favoriteProvider.itemsList[index],
                              deleteTap: () {
                                favoriteProvider.removeFromFavorites(
                                    favoriteProvider.itemsList[index].itemId!);
                                showSnackBar(context,
                                    msg: "Removed from favorite");
                              },
                            ),
                          );
                        },
                      ),
          );
        },
      ),
    );
  }
}
