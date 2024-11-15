import 'package:flutter/material.dart';

import '../../../../../core/constants/app_text_styles.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password", style: AppTextStyles.largeRegular),
      ),
    );
  }
}
