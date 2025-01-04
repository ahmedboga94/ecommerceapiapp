import 'package:ecommerceapiapp/features/presentation/views/favorites/widgets/fav_item_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/di/init_di.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/profile/get_user_favorite_items_use_case.dart';
import '../../provider/profile/favorite_provider.dart';

class FavoritesView extends StatelessWidget {
  final UserEntity userEntity;
  const FavoritesView({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider(
          getUserFavoriteItemsUseCase: di<GetUserFavoriteItemsUseCase>(),
          userId: userEntity.id!),
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
                              deleteTap: () {},
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
