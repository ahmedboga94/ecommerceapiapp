import 'package:ecommerceapiapp/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(AppAssets.onBording1),
    );
  }
}
