import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_server_links.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../domain/entities/item_entity.dart';
import '../../../widgets/counter_item.dart';

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
          child: Stack(
            children: [
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          // color: context.color.highlight,
                          padding: const EdgeInsets.all(5),
                          child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: CachedNetworkImage(
                                  imageUrl: AppServerLinks.itemsImagesPath +
                                      itemEntity.itemImage!,
                                  width: 95,
                                  height: 120,
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
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Text(itemEntity.itemName!,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                                maxLines: 2))
                                      ]),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(itemEntity.itemDescription!,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                const Divider(thickness: 1),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${itemEntity.itemPrice} EGP",
                                        style: const TextStyle(
                                            color: AppColors.primeColor,
                                            fontWeight: FontWeight.bold)),
                                    CounterItem(
                                      quantityNum: 1,
                                      incrementFunc: () {},
                                      decrementFunc: () {},
                                    )
                                  ],
                                )
                              ]))),
                ],
              ),
              Positioned(
                top: -5,
                right: 10,
                child: IconButton(
                  onPressed: deleteTap,
                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
