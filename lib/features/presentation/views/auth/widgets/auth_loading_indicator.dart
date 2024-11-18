import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';

class AuthLoadingIndicator extends StatelessWidget {
  const AuthLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.whiteColor,
      ),
    );
  }
}
