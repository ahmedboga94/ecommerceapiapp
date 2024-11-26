import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/auth/reset_password_provider.dart';
import '../../../../widgets/custom_text_form.dart';
import '../../widgets/auth_headline.dart';
import '../../widgets/auth_loading_indicator.dart';

class ResetPasswordViewBody extends StatelessWidget {
  final String mail;
  const ResetPasswordViewBody({super.key, required this.mail});

  @override
  Widget build(BuildContext context) {
    return Consumer<ResetPasswordProvider>(
      builder: (context, resetPasswordProvider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: SingleChildScrollView(
            child: Form(
              key: resetPasswordProvider.formKey,
              child: Column(
                children: [
                  AuthHeadline(
                      headline: "Enter New Password",
                      subHeadline:
                          "That's last step to recover your account\n $mail"),
                  const SizedBox(height: 35),
                  CustomTextForm(
                    hint: "Enter Your Password",
                    icon: IconButton(
                        onPressed: () =>
                            resetPasswordProvider.visiblePassword(),
                        icon: Icon(resetPasswordProvider.isPassVisible
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    secureText: resetPasswordProvider.isPassVisible,
                    enable: !resetPasswordProvider.isLoading,
                    validator: (value) =>
                        resetPasswordProvider.passwordValidator(value!,
                            hintPass: "Enter Your Password",
                            hintVaildPassword:
                                "Enter words and numbers at least 8"),
                    onChanged: (val) => resetPasswordProvider.password = val,
                  ),
                  const SizedBox(height: 25),
                  CustomTextForm(
                    hint: "Re-enter Your Password",
                    icon: IconButton(
                        onPressed: () =>
                            resetPasswordProvider.visibleConfirmPassword(),
                        icon: Icon(resetPasswordProvider.isConfirmPassVisible
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    secureText: resetPasswordProvider.isConfirmPassVisible,
                    enable: !resetPasswordProvider.isLoading,
                    validator: (value) =>
                        resetPasswordProvider.passwordConfirmValidator(value!,
                            hintPass: "Re-enter your Password",
                            hintNotMatch: "Passwords don't match"),
                    onChanged: (val) =>
                        resetPasswordProvider.confirmPassword = val,
                  ),
                  const SizedBox(height: 35),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () =>
                          resetPasswordProvider.changeAndConfirmPass(
                        context,
                        mail: mail,
                        msg: "Password recoverd Successfully",
                      ),
                      child: resetPasswordProvider.isLoading
                          ? const AuthLoadingIndicator()
                          : const Text("Confirm"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
