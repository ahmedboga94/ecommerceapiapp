import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/init_di.dart';
import '../../provider/main/main_view_provider.dart';
import '../../provider/profile/profile_provider.dart';
import '../cart/cart_view.dart';
import '../category/category_view.dart';
import '../home/home_view.dart';
import '../profile/profile_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainViewProvider()),
        ChangeNotifierProvider(create: (context) => di<ProfileProvider>())
      ],
      child: Consumer<MainViewProvider>(
        builder: (context, mainViewProvider, child) {
          return Scaffold(
            body: PageView(
              controller: mainViewProvider.pageController,
              onPageChanged: (index) {
                mainViewProvider.setPage(index);
              },
              children: const [
                HomeView(),
                CategoryView(),
                CartView(),
                ProfileView(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primeColor,
              // showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: mainViewProvider.currentPage,
              onTap: (index) {
                mainViewProvider.animateTo(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined, size: 30),
                  activeIcon: Icon(Icons.home, size: 30),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view_outlined, size: 30),
                  activeIcon: Icon(Icons.grid_view_rounded, size: 30),
                  label: "Category",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined, size: 30),
                  activeIcon: Icon(Icons.shopping_bag, size: 30),
                  label: "Cart",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outlined, size: 30),
                  activeIcon: Icon(Icons.person, size: 30),
                  label: "Profile",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
