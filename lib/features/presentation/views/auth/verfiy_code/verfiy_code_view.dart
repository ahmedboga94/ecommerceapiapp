import 'package:ecommerceapiapp/features/presentation/views/auth/widgets/auth_headline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/utils/app_routes.dart';

class VerfiyCodeView extends StatelessWidget {
  const VerfiyCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    String mail = "ahmedboga@email.com";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verfiy Code", style: AppTextStyles.largeRegular),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthHeadline(
                  headline: "Check Code",
                  subHeadline: "Please Enter Digit Code that sent to $mail"),
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.push(AppRoutes.resetPasswordView);
                  },
                  child: const Text("Verfiy"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
