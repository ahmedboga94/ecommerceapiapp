import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_server_links.dart';
import '../../../../core/di/init_di.dart';
import '../../../../core/utils/app_routes.dart';
import '../../provider/profile/favorite_provider.dart';

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
                            child: Card(
                              child: ListTile(
                                title: Text(favoriteProvider
                                    .itemsList[index].itemName!),
                                subtitle: Text(
                                    "${favoriteProvider.itemsList[index].itemPrice!} EGP"),
                                leading: Image.network(
                                  AppServerLinks.itemsImagesPath +
                                      favoriteProvider
                                          .itemsList[index].itemImage!,
                                ),
                              ),
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
