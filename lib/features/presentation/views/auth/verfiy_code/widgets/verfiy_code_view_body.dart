import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_routes.dart';
import '../../widgets/auth_headline.dart';

class VerfiyCodeViewBody extends StatelessWidget {
  final String email;
  const VerfiyCodeViewBody({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeadline(
                headline: "Check Code",
                subHeadline: "Please Enter Digit Code that sent to $email"),
            const SizedBox(height: 15),
            OtpTextField(
              numberOfFields: 5,
              fieldWidth: 50,
              borderRadius: BorderRadius.circular(18),
              showFieldAsBox: true,
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              onSubmit: (String verificationCode) {
                context.push(AppRoutes.resetPasswordView);
              }, // end onSubmit
            ),
            const SizedBox(height: 60),
            TextButton(
                onPressed: () {}, child: const Text("Resent your code again?"))
          ],
        ),
      ),
    );
  }
}
