import 'package:flutter/material.dart';

import '../../../../domain/entities/on_boarding_entity.dart';

class OnBoardingBody extends StatelessWidget {
  final OnBoardingEntity onBoardingEntity;
  const OnBoardingBody({super.key, required this.onBoardingEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(onBoardingEntity.title),
        Image.asset(onBoardingEntity.image),
        Text(onBoardingEntity.body),
      ],
    );
  }
}
