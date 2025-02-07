import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/di/init_di.dart';
import '../../../../core/utils/app_routes.dart';
import '../../provider/cart/cart_provider.dart';
import 'widgets/cart_item_card.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => di<CartProvider>(),
      child: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return Scaffold(
            appBar: AppBar(title: const Text("Favorites")),
            body: cartProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : cartProvider.itemsList.isEmpty
                    ? const Center(child: Text("No Items Here"))
                    : ListView.builder(
                        itemCount: cartProvider.itemsList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => context.push(AppRoutes.itemDetails,
                                extra: cartProvider.itemsList[index]),
                            child: Column(
                              children: [
                                // Text(cartProvider.)
                                CartItemCard(
                                  itemEntity: cartProvider.itemsList[index],
                                  deleteTap: () {},
                                ),
                              ],
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
