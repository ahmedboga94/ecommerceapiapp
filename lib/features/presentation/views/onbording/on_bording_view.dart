import 'package:flutter/material.dart';

import '../../../data/datasources/on_bording_local.dart';
import 'widgets/on_boarding_body.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: onBoardingDataList.length,
          itemBuilder: (context, index) {
            return OnBoardingBody(
              onBoardingEntity: onBoardingDataList[index],
            );
          },
        ),
      ),
    );
  }
}
