import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../provider/auth/login_provider.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
          "Login",
          style: AppTextStyles.largeRegular,
        )),
        body: const PopScope(
          canPop: false,
          child: LoginViewBody(),
        ),
      ),
    );
  }
}
