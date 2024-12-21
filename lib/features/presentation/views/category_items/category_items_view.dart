import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/di/init_di.dart';
import '../../../domain/entities/category_entity.dart';
import '../../provider/category_items/category_items_provider.dart';
import '../../widgets/item_card_widget.dart';

class CategoryItemsView extends StatelessWidget {
  final CategoryEntity categoryEntity;
  const CategoryItemsView({super.key, required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CategoryItemsProvider(
          getCategoryItemsUseCase: di(), selectedCategory: categoryEntity),
      child: Scaffold(
        appBar: AppBar(title: Text(categoryEntity.categoryName!)),
        body: Consumer<CategoryItemsProvider>(
          builder: (context, categoryItemsProvider, child) {
            return categoryItemsProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : categoryItemsProvider.itemsList.isEmpty
                    ? const Center(child: Text("No Items Here"))
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: categoryItemsProvider.itemsList.length,
                        itemBuilder: (context, index) {
                          return ItemCard(
                            itemEntity: categoryItemsProvider.itemsList[index],
                            onTap: () {},
                            favTap: () {},
                            isFav: false,
                            addToCart: () {},
                          );
                        },
                      );
          },
        ),
      ),
    );
  }
}
