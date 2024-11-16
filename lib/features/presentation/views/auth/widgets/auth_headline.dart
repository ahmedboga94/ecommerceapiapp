import 'package:flutter/material.dart';

import '../../../../../core/constants/app_text_styles.dart';

class AuthHeadline extends StatelessWidget {
  final String headline, subHeadline;
  const AuthHeadline(
      {super.key, required this.headline, required this.subHeadline});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(headline, style: AppTextStyles.headLineBold),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Text(subHeadline,
              textAlign: TextAlign.center, style: AppTextStyles.mediumRegular),
        ),
      ],
    );
  }
}
