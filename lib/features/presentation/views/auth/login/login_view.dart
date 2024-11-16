import 'package:ecommerceapiapp/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../widgets/custom_text_form.dart';
import '../widgets/auth_headline.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login", style: AppTextStyles.largeRegular),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AuthHeadline(
                  headline: "Welcome Back",
                  subHeadline:
                      "Sign in your Email and Password or continue With Social Media"),
              const SizedBox(height: 45),
              CustomTextForm(
                hint: "Enter Your E-Mail",
                icon: const Icon(Icons.email_outlined),
                onChanged: (val) {
                  print("$val============");
                },
              ),
              const SizedBox(height: 25),
              CustomTextForm(
                hint: "Enter Your Password",
                icon: const Icon(Icons.lock_outlined),
                secureText: true,
                onChanged: (val) {},
              ),
              const SizedBox(height: 8),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => context.push(AppRoutes.forgetPasswordView),
                    child: const Text("Forget Password?"),
                  )),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("Login")),
              ),
              const SizedBox(height: 20),
              const Divider(),
              TextButton(
                  onPressed: () => context.push(AppRoutes.signUpView),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("If you don't have an account, "),
                      Text("Click Here!",
                          style: AppTextStyles.bold
                              .copyWith(color: AppColors.primeColor)),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
