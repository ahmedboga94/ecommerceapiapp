// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/di/init_di.dart';
import '../../../provider/auth/reset_password_provider.dart';
import 'widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  final String mail;
  const ResetPasswordView({super.key, required this.mail});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => di<ResetPasswordProvider>(),
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
          "Reset Password",
          style: AppTextStyles.largeRegular,
        )),
        body: ResetPasswordViewBody(mail: mail),
      ),
    );
  }
}
