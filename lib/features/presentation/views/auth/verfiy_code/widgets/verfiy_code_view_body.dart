import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/functions/show_snack_bar.dart';
import '../../../../provider/auth/verfiy_code_provider.dart';
import '../../widgets/auth_headline.dart';

class VerfiyCodeViewBody extends StatelessWidget {
  final String email;
  const VerfiyCodeViewBody({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Consumer<VerfiyCodeProvider>(
      builder: (context, verfiycodeProvider, child) {
        if (verfiycodeProvider.errorMessage != null) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            showSnackBar(context, msg: verfiycodeProvider.errorMessage!);
            verfiycodeProvider.clearError();
          });
        }
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
                  enabled: !verfiycodeProvider.isLoading,
                  onSubmit: (String verificationCode) {
                    verfiycodeProvider.verfiyCodeWithEmail(
                      context,
                      email: email,
                      verfiyCode: verificationCode,
                      msg: "Account was created successfully",
                    );
                  }, // end onSubmit
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  child: verfiycodeProvider.isLoading
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
