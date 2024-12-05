import 'package:ecommerceapiapp/features/presentation/provider/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/search_and_notifications.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Column(
            children: [
              const SearchAndNotifications(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
              Consumer<HomeProvider>(
                builder: (context, home, child) {
                  return home.isLoading
                      ? const Text("Loooding")
                      : Row(
                          children: [
                            ...List.generate(
                                home.categories.length,
                                (index) => Column(
                                      children: [
                                        Text(
                                            "${home.categories[index].categoryNameAr}    "),
                                        Text(
                                            "${home.categories[index].categoryName}    "),
                                      ],
                                    ))
                          ],
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
