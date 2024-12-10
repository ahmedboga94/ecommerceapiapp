import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../provider/home/home_provider.dart';
import '../../widgets/product_card_widget.dart';
import 'widgets/categories_list_view.dart';
import 'widgets/home_banner.dart';
import 'widgets/search_and_notifications.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SearchAndNotifications(),
                    const HomeBanner(),
                    CategoriesListView(homeProvider),
                    const Text("Products For You",
                        style: AppTextStyles.headLineBold),
                    SizedBox(
                      height: 290,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return ItemCard(
                            onTap: () {},
                            favTap: () {},
                            imageUrl: '',
                            title: '',
                            price: 5.1,
                            isFav: false,
                            addToCart: () {},
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
