import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/utils/app_routes.dart';
import '../../../../provider/auth/login_provider.dart';
import '../../../../widgets/custom_text_form.dart';
import '../../widgets/auth_headline.dart';
import '../../widgets/auth_loading_indicator.dart';
import 'click_here_signup_textbtn.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, loginProvider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: SingleChildScrollView(
            child: Form(
              key: loginProvider.formKey,
              autovalidateMode: AutovalidateMode.disabled,
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
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => loginProvider.emailValidator(value!,
                        hintEmail: "Enter Your Mail First",
                        hintVaildEmail: "Enter Vaild Email"),
                    onChanged: (val) => loginProvider.email = val,
                  ),
                  const SizedBox(height: 25),
                  CustomTextForm(
                    hint: "Enter Your Password",
                    icon: IconButton(
                        onPressed: () => loginProvider.visiblePassword(),
                        icon: Icon(loginProvider.isPassVisible
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    secureText: loginProvider.isPassVisible,
                    validator: (value) => loginProvider.passwordValidator(
                        value!,
                        hintPass: "Enter Your Password to continue"),
                    onChanged: (val) => loginProvider.password = val,
                  ),
                  const SizedBox(height: 8),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () =>
                            context.push(AppRoutes.forgetPasswordView),
                        child: const Text("Forget Password?"),
                      )),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: loginProvider.isLoading
                            ? null
                            : () => loginProvider.loginWithEmailandPassword(),
                        child: loginProvider.isLoading
                            ? const AuthLoadingIndicator()
                            : const Text("Login")),
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  const ClickHereSignUpTextButton()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
