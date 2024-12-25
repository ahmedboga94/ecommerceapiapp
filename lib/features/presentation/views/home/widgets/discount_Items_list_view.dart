import 'package:flutter/material.dart';

import '../../../provider/home/home_provider.dart';
import '../../../widgets/item_card_widget.dart';

class DiscountItemsListView extends StatelessWidget {
  final HomeProvider homeProvider;
  const DiscountItemsListView(this.homeProvider, {super.key});

  @override
  Widget build(BuildContext context) {
    return homeProvider.isLoading
        ? const CircularProgressIndicator()
        : SizedBox(
            height: 285,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: homeProvider.itemsList.length,
              itemBuilder: (context, index) {
                return ItemCard(
                  itemEntity: homeProvider.itemsList[index],
                  favTap: () {},
                  isFav: false,
                  addToCart: () {},
                );
              },
            ),
          );
  }
}
