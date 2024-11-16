import 'package:flutter/material.dart';

import '../../../../../core/constants/app_text_styles.dart';
import '../../../widgets/custom_text_form.dart';
import '../widgets/auth_headline.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password", style: AppTextStyles.largeRegular),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AuthHeadline(
                  headline: "Enter New Password",
                  subHeadline: "That's l ast step to recover your account"),
              const SizedBox(height: 35),
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
            ],
          ),
        ),
      ),
    );
  }
}
