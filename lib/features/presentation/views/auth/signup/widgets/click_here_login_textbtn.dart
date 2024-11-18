import 'package:ecommerceapiapp/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';

class ClickHereLoginTextButton extends StatelessWidget {
  const ClickHereLoginTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.go(AppRoutes.loginView),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("If you have an account, "),
          Text(
            "Click Here!",
            style: AppTextStyles.bold.copyWith(color: AppColors.primeColor),
          ),
        ],
      ),
    );
  }
}
