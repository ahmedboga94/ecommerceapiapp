import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/di/init_di.dart';
import '../../../provider/auth/sign_up_provider.dart';
import 'widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => di<SignUpProvider>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign Up", style: AppTextStyles.largeRegular),
        ),
        body: const SignUpViewBody(),
      ),
    );
  }
}
