import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_server_links.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/app_routes.dart';
import '../../domain/entities/item_entity.dart';
import '../provider/profile/favorite_provider.dart';

class ItemCard extends StatelessWidget {
  final ItemEntity itemEntity;
  final Function() addToCart;

  const ItemCard({
    super.key,
    required this.addToCart,
    required this.itemEntity,
  });

  @override
  Widget build(BuildContext context) {
    var widthVar = MediaQuery.of(context).size.width;
    var hightVar = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => context.push(AppRoutes.itemDetails, extra: itemEntity),
      child: Center(
        child: Stack(
          children: [
            SizedBox(
              width: widthVar * 0.45,
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                  color: Theme.of(context).highlightColor,
                                  padding: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                          imageUrl:
                                              AppServerLinks.itemsImagesPath +
                                                  itemEntity.itemImage!,
                                          placeholder: (context, url) =>
                                              const Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.image, size: 30),
                                          width: widthVar * 0.35,
                                          height: hightVar * 0.17,
                                          fit: BoxFit.cover))))),
                      Text(itemEntity.translatedItemName(),
                          maxLines: 1, style: AppTextStyles.bold),
                      Text("${itemEntity.itemPrice!} L.E.",
                          maxLines: 1,
                          style: AppTextStyles.bold
                              .copyWith(color: AppColors.primeColor)),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                icon: const Icon(Icons.shopping_bag,
                                    color: AppColors.primeColor, size: 30),
                                onPressed: addToCart)
                          ])
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: IconButton(
                  icon: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 32,
                      height: 32,
                      color: context
                              .read<FavoriteProvider>()
                              .checkFavedIco(itemEntity.itemId!)
                          ? AppColors.primeColor
                          : Colors.grey,
                      child: const Icon(Icons.favorite,
                          color: Colors.white, size: 28),
                    ),
                  ),
                  onPressed: () {
                    context
                        .read<FavoriteProvider>()
                        .checkItemInFav(context, itemEntity.itemId!);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
