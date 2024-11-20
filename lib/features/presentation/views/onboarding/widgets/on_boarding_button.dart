import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../data/datasources/local/on_bording_local.dart';
import '../../../provider/onboarding/onboarding_provider.dart';

class OnBoardingButton extends StatelessWidget {
  final OnBoardingProvider onBoarding;
  const OnBoardingButton({super.key, required this.onBoarding});

  @override
  Widget build(BuildContext context) {
    bool isCurrentPage =
        onBoarding.currentPage == onBoardingDataList.length - 1;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isCurrentPage
            ? () => context.go(AppRoutes.loginView)
            : () => onBoarding.animateTo(),
        child: Text(isCurrentPage ? "Get Started" : "Continue",
            style: AppTextStyles.mediumRegular),
      ),
    );
  }
}
