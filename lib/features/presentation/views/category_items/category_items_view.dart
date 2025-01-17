import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/di/init_di.dart';
import '../../../domain/entities/category_entity.dart';
import '../../provider/category_items/category_items_provider.dart';
import '../../provider/profile/favorite_provider.dart';
import '../../widgets/item_card_widget.dart';

class CategoryItemsView extends StatelessWidget {
  final CategoryEntity categoryEntity;
  const CategoryItemsView({super.key, required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => CategoryItemsProvider(
                getCategoryItemsUseCase: di(),
                selectedCategory: categoryEntity)),
        ChangeNotifierProvider(create: (_) => di<FavoriteProvider>()),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text(categoryEntity.translatedCategoryName())),
        body: Consumer2<CategoryItemsProvider, FavoriteProvider>(
          builder: (context, categoryItemsProvider, favoriteProvider, child) {
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
