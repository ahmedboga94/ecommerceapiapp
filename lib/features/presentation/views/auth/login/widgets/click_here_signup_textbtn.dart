import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/utils/app_routes.dart';

class ClickHereSignUpTextButton extends StatelessWidget {
  const ClickHereSignUpTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.push(AppRoutes.signUpView),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("If you don't have an account, "),
          Text(
            "Click Here!",
            style: AppTextStyles.bold.copyWith(color: AppColors.primeColor),
          ),
        ],
      ),
    );
  }
}
