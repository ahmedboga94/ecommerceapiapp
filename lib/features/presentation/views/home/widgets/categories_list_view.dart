import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_server_links.dart';
import '../../../provider/home/home_provider.dart';

class CategoriesListView extends StatelessWidget {
  final HomeProvider homeProvider;
  const CategoriesListView(this.homeProvider, {super.key});

  @override
  Widget build(BuildContext context) {
    return homeProvider.isLoading
        ? const CircularProgressIndicator()
        : SizedBox(
            height: 110,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: homeProvider.categoriesList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // homeProvider.itemssByCategory(
                    //     homeProvider.categoriesList[index].categoryId);
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: AppColors.geryLiteColor,
                            borderRadius: BorderRadius.circular(18)),
                        child: SvgPicture.network(
                          "${AppServerLinks.categoriesImagesPath}${homeProvider.categoriesList[index].categoryImage}",
                          height: 60,
                        ),
                      ),
                      Text(
                          "${homeProvider.categoriesList[index].categoryName}"),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 15),
            ),
          );
  }
}
