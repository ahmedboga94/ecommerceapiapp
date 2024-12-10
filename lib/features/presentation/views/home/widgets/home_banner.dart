import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: AppColors.primeColor,
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
