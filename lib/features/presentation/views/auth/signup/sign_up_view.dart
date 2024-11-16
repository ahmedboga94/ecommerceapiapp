import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../widgets/custom_text_form.dart';
import '../widgets/auth_headline.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up", style: AppTextStyles.largeRegular),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AuthHeadline(
                  headline: "Create Account",
                  subHeadline: "Sign up with your Email and Password"),
              const SizedBox(height: 35),
              CustomTextForm(
                hint: "Enter Your Name",
                icon: const Icon(Icons.person_outlined),
                onChanged: (val) {
                  print("$val============");
                },
              ),
              const SizedBox(height: 25),
              CustomTextForm(
                hint: "Enter Your E-Mail",
                icon: const Icon(Icons.email_outlined),
                onChanged: (val) {
                  print("$val============");
                },
              ),
              const SizedBox(height: 25),
              CustomTextForm(
                hint: "Enter Your Phone Number",
                icon: const Icon(Icons.phone_android_outlined),
                keyboardType: TextInputType.phone,
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
              const SizedBox(height: 25),
              CustomTextForm(
                hint: "Re-enter Your Password",
                icon: const Icon(Icons.lock_outlined),
                secureText: true,
                onChanged: (val) {},
              ),
              const SizedBox(height: 35),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("Sign Up")),
              ),
              const SizedBox(height: 20),
              const Divider(),
              TextButton(
                  onPressed: () => context.go(AppRoutes.loginView),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("If you have an account, "),
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
