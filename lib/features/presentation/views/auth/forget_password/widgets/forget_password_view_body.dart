import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../provider/auth/forget_password_provider.dart';
import '../../../../widgets/custom_text_form.dart';
import '../../widgets/auth_headline.dart';
import '../../widgets/auth_loading_indicator.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ForgetPasswordProvider>(
      builder: (context, forgetPasswordProvider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: SingleChildScrollView(
            child: Form(
              key: forgetPasswordProvider.formKey,
              child: Column(
                children: [
                  const AuthHeadline(
                      headline: "Check Email",
                      subHeadline:
                          "write your Email to recover your account and send verfiy Code"),
                  CustomTextForm(
                    hint: "Enter Your Email",
                    icon: const Icon(Icons.email_outlined),
                    enable: !forgetPasswordProvider.isLoading,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => forgetPasswordProvider.emailValidator(
                        value!,
                        hintEmail: "Enter Your Mail First",
                        hintVaildEmail: "Enter Vaild Email"),
                    onChanged: (val) =>
                        forgetPasswordProvider.email = val.toLowerCase(),
                  ),
                  const SizedBox(height: 35),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: forgetPasswordProvider.isLoading
                          ? null
                          : () =>
                              forgetPasswordProvider.forgetPassword(context),
                      child: forgetPasswordProvider.isLoading
                          ? const AuthLoadingIndicator()
                          : const Text("Check"),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
