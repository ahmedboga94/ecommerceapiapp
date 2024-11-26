import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

import '../../../../provider/auth/reset_password_verfiy_provider.dart';
import '../../widgets/auth_headline.dart';

class ResetPasswordVerfiyViewBody extends StatelessWidget {
  final String email;
  const ResetPasswordVerfiyViewBody({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Consumer<ResetPasswordVerfiyProvider>(
      builder: (context, resetPasswordVerfiyProvider, child) {
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
                  enabled: !resetPasswordVerfiyProvider.isLoading,
                  onSubmit: (String verificationCode) {
                    resetPasswordVerfiyProvider.resetPassWithCode(context,
                        email: email, verfiyCode: verificationCode);
                  }, // end onSubmit
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  child: resetPasswordVerfiyProvider.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox(),
                ),
                const SizedBox(height: 20),
                TextButton(
                    onPressed: () {},
                    child: const Text("Resent your code again?"))
              ],
            ),
          ),
        );
      },
    );
  }
}
