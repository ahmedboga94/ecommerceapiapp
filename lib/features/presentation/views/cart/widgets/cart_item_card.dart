import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_server_links.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../domain/entities/item_entity.dart';

class CartItemCard extends StatelessWidget {
  final ItemEntity itemEntity;
  final Function() deleteTap;
  const CartItemCard({
    super.key,
    required this.itemEntity,
    required this.deleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () => context.push(AppRoutes.itemDetails, extra: itemEntity),
        child: Card(
          elevation: 0.0,
          clipBehavior: Clip.antiAlias,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      // color: context.color.highlight,
                      padding: const EdgeInsets.all(5),
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: CachedNetworkImage(
                              imageUrl: AppServerLinks.itemsImagesPath +
                                  itemEntity.itemImage!,
                              width: 80,
                              height: 75,
                              fit: BoxFit.cover)),
                    ),
                  )),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Text(itemEntity.itemName!,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                          maxLines: 2))
                                ]),
                            Text(itemEntity.itemDescription!,
                                maxLines: 1,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            const Divider(thickness: 1),
                            Text("${itemEntity.itemPrice} EGP",
                                style: const TextStyle(
                                    color: AppColors.primeColor,
                                    fontWeight: FontWeight.bold))
                          ]))),
              IconButton(
                onPressed: deleteTap,
                icon: const Icon(Icons.remove_circle, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
