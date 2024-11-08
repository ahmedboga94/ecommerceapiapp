import 'package:ecommerceapiapp/features/presentation/provider/onboarding/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/on_boarding_body.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnBoardingProvider(),
      builder: (context, child) {
        return const OnBoardingBody();
      },
    );
  }
}
