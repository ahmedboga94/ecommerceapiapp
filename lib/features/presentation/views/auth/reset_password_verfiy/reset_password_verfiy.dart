import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/di/init_di.dart';
import '../../../provider/auth/reset_password_verfiy_provider.dart';
import 'widgets/reset_password_verfiy_view_body.dart';

class ResetPasswordVerfiyView extends StatelessWidget {
  final String email;
  const ResetPasswordVerfiyView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => di<ResetPasswordVerfiyProvider>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Verfiy Code", style: AppTextStyles.largeRegular),
        ),
        body: ResetPasswordVerfiyViewBody(email: email),
      ),
    );
  }
}
