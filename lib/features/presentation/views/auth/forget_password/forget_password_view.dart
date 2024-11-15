import 'package:flutter/material.dart';

import '../../../../../core/constants/app_text_styles.dart';
import '../../../widgets/custom_text_form.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forget Password", style: AppTextStyles.largeRegular),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            const Text("Check Email", style: AppTextStyles.headLineBold),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Text(
                  "Sign in your Email and Password or continue With Social Media",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.mediumRegular),
            ),
            CustomTextForm(
              hint: "Enter Your Email",
              icon: const Icon(Icons.email_outlined),
              onChanged: (val) {},
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, child: Text("Check")),
            )
          ],
        ),
      ),
    );
  }
}