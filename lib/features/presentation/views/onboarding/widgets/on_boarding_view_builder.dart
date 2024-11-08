import 'package:flutter/material.dart';

import '../../../../data/datasources/on_bording_local.dart';
import 'on_boarding_pics_viewer.dart';

class OnBoardingViewBuilder extends StatelessWidget {
  final Function(int) onPageChanged;
  final PageController controller;
  const OnBoardingViewBuilder(
      {super.key, required this.onPageChanged, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        onPageChanged: onPageChanged,
        controller: controller,
        itemCount: onBoardingDataList.length,
        itemBuilder: (context, index) {
          return OnBoardingPicsViewer(
              onBoardingEntity: onBoardingDataList[index]);
        },
      ),
    );
  }
}
