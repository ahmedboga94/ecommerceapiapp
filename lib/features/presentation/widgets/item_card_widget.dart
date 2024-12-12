import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_server_links.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../domain/entities/item_entity.dart';

class ItemCard extends StatelessWidget {
  final ItemEntity itemEntity;
  final Function() onTap, favTap, addToCart;
  final bool isFav;

  const ItemCard({
    super.key,
    required this.onTap,
    required this.favTap,
    required this.isFav,
    required this.addToCart,
    required this.itemEntity,
  });

  @override
  Widget build(BuildContext context) {
    var widthVar = MediaQuery.of(context).size.width;
    var hightVar = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
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
                                  // color: context.color.highlight,
                                  padding: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                          imageUrl:
                                              "${AppServerLinks.itemsImagesPath}${itemEntity.itemImage!}",
                                          placeholder: (context, url) =>
                                              const Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.image, size: 30),
                                          width: widthVar * 0.35,
                                          height: hightVar * 0.17,
                                          fit: BoxFit.cover))))),
                      Text(itemEntity.itemName!,
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
                  icon: isFav
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                              width: 32,
                              height: 32,
                              color: AppColors.primeColor,
                              child: const Icon(Icons.favorite_border_rounded,
                                  color: Colors.white, size: 31)))
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                              width: 32,
                              height: 32,
                              color: Colors.grey,
                              child: const Icon(Icons.heart_broken_rounded,
                                  color: Colors.white, size: 31))),
                  onPressed: favTap),
            ),
          ],
        ),
      ),
    );
  }
}
