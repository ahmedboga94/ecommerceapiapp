import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/di/init_di.dart';
import '../../../provider/auth/forget_password_provider.dart';
import 'widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => di<ForgetPasswordProvider>(),
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
          "Forget Password",
          style: AppTextStyles.largeRegular,
        )),
        body: const ForgetPasswordViewBody(),
      ),
    );
  }
}
