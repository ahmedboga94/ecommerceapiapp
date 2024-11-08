import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/app_text_styles.dart';
import '../../../../domain/entities/on_boarding_entity.dart';

class OnBoardingPicsViewer extends StatelessWidget {
  final OnBoardingEntity onBoardingEntity;
  const OnBoardingPicsViewer({super.key, required this.onBoardingEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 2),
        Text(onBoardingEntity.title, style: AppTextStyles.largeBold),
        const Spacer(flex: 5),
        SizedBox(
          height: 300,
          child: SvgPicture.asset(
            onBoardingEntity.image,
            fit: BoxFit.fill,
          ),
        ),
        const Spacer(flex: 5),
        Text(
          onBoardingEntity.body,
          style: AppTextStyles.mediumRegular,
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 3),
      ],
    );
  }
}
