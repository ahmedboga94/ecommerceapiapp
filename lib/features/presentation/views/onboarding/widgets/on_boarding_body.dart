import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/datasources/on_bording_local.dart';
import '../../../provider/onboarding/onboarding_provider.dart';
import '../../../widgets/dots_pointer.dart';
import 'on_boarding_button.dart';
import 'on_boarding_view_builder.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OnBoardingProvider>(
        builder: (context, onBoarding, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
            child: Column(
              children: [
                const SizedBox(height: 20),
                OnBoardingViewBuilder(
                  onPageChanged: (currentPage) =>
                      onBoarding.onPageChanged(currentPage),
                  controller: onBoarding.pageController,
                ),
                DotsPointer(
                    itemsList: onBoardingDataList,
                    activeDot: onBoarding.currentPage),
                const SizedBox(height: 100),
                OnBoardingButton(onBoarding: onBoarding),
                const SizedBox(height: 50),
              ],
            ),
          );
        },
      ),
    );
  }
}
