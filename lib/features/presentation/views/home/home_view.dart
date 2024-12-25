import 'package:ecommerceapiapp/core/functions/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../provider/home/home_provider.dart';
import 'widgets/categories_list_view.dart';
import 'widgets/discount_items_list_view.dart';
import 'widgets/home_banner.dart';
import 'widgets/search_and_notifications.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (homeProvider.errorMessage != null) {
              showSnackBar(context, msg: homeProvider.errorMessage!);
            }
            homeProvider.clearErrorMessage();
          });

          return RefreshIndicator(
            onRefresh: () => homeProvider.refreshHome(),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SearchAndNotifications(),
                      const HomeBanner(),
                      const Text("Categories",
                          style: AppTextStyles.headLineBold),
                      CategoriesListView(homeProvider),
                      const Text("Products For You",
                          style: AppTextStyles.headLineBold),
                      DiscountItemsListView(homeProvider),
                      const Text("Offers", style: AppTextStyles.headLineBold),
                      DiscountItemsListView(homeProvider),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
