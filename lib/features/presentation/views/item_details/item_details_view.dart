import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapiapp/core/functions/translate_database.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_server_links.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../domain/entities/item_entity.dart';
import '../../provider/item_details/item_details_provider.dart';
import '../../widgets/counter_item.dart';

class ItemDetailsView extends StatelessWidget {
  final ItemEntity itemEntity;
  const ItemDetailsView({super.key, required this.itemEntity});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemDetailsProvider(),
      child: Consumer<ItemDetailsProvider>(
        builder: (context, itemDetailsProvider, child) => Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.33,
                        child: CachedNetworkImage(
                          imageUrl: AppServerLinks.itemsImagesPath +
                              itemEntity.itemImage!,
                        ),
                      ),
                      ListTile(
                          title: Text(itemEntity.translatedItemName(),
                              style: AppTextStyles.largeRegular)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          spacing: 15,
                          alignment: WrapAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              child: Chip(
                                  avatar: const Icon(Icons.price_change),
                                  label: Text("${itemEntity.itemPrice} EGP")),
                            ),
                            Chip(
                                avatar: const Icon(Icons.star),
                                label: Text("${itemEntity.itemId}")),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          title: const Text("Description",
                              style: AppTextStyles.headLineBold),
                          subtitle: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              itemEntity.translatedItemDescription(),
                              style: AppTextStyles.mediumRegular,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: isLanguage() ? null : 10,
                    left: isLanguage() ? 10 : null,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: AppColors.primeColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                          onPressed: () => context.pop(),
                          icon: const Icon(Icons.arrow_back_ios_new_outlined,
                              color: AppColors.whiteColor)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: 140,
            padding:
                const EdgeInsets.only(bottom: 20, top: 4, right: 8, left: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: ListTile(
                      title: Text(
                        itemEntity.itemPrice!,
                        style: AppTextStyles.mediumRegular,
                      ),
                      trailing: Text(
                        "${itemEntity.itemPrice} EGP",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primeColor),
                      )),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 55,
                      width: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.primeColor,
                              style: BorderStyle.solid,
                              width: 1),
                          borderRadius: BorderRadius.circular(18.0)),
                      child: CounterItem(
                        quantityNum: itemDetailsProvider.quantity,
                        decrementFunc: itemDetailsProvider.decrementQuantity,
                        incrementFunc: itemDetailsProvider.incrementQuantity,
                      ),
                    ),
                    SizedBox(
                      width: 185,
                      height: 55,
                      child: ElevatedButton.icon(
                        icon:
                            const Icon(Icons.shopping_bag, color: Colors.white),
                        label: const Text("Add to Cart"),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
