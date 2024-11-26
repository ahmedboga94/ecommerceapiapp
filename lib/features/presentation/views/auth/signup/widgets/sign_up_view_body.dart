import 'package:ecommerceapiapp/core/functions/string_capitalize_casing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../provider/auth/sign_up_provider.dart';
import '../../../../widgets/custom_text_form.dart';
import '../../widgets/auth_headline.dart';
import '../../widgets/auth_loading_indicator.dart';
import 'click_here_login_textbtn.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpProvider>(
      builder: (context, signUpProvider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: SingleChildScrollView(
            child: Form(
              key: signUpProvider.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                children: [
                  const AuthHeadline(
                      headline: "Create Account",
                      subHeadline: "Sign up with your Email and Password"),
                  const SizedBox(height: 35),
                  CustomTextForm(
                    hint: "Enter Your Name",
                    icon: const Icon(Icons.person_outlined),
                    enable: !signUpProvider.isLoading,
                    validator: (value) => signUpProvider.nameValidator(value!,
                        hintUserName: "Enter Name",
                        nameLength6Hint: "Name can't be less than 6 words"),
                    onChanged: (val) =>
                        signUpProvider.userName = val.toTitleCase,
                  ),
                  const SizedBox(height: 25),
                  CustomTextForm(
                    hint: "Enter Your E-Mail",
                    icon: const Icon(Icons.email_outlined),
                    keyboardType: TextInputType.emailAddress,
                    enable: !signUpProvider.isLoading,
                    validator: (value) => signUpProvider.emailValidator(value!,
                        hintEmail: "Enter Email",
                        hintVaildEmail: "Enter Vaild Mail"),
                    onChanged: (val) =>
                        signUpProvider.email = val.toLowerCase(),
                  ),
                  const SizedBox(height: 25),
                  CustomTextForm(
                    hint: "Enter Your Phone Number",
                    icon: const Icon(Icons.phone_android_outlined),
                    keyboardType: TextInputType.phone,
                    enable: !signUpProvider.isLoading,
                    validator: (value) => signUpProvider.phoneNumberValidator(
                        value!,
                        hintPhoneNumber: "Enter Phone Number",
                        nameLength10Hint:
                            "Phone Number can't be less than 10 numbers"),
                    onChanged: (val) => signUpProvider.phoneNumber = val,
                  ),
                  const SizedBox(height: 25),
                  CustomTextForm(
                    hint: "Enter Your Password",
                    icon: IconButton(
                        onPressed: () => signUpProvider.visiblePassword(),
                        icon: Icon(signUpProvider.isPassVisible
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    secureText: signUpProvider.isPassVisible,
                    enable: !signUpProvider.isLoading,
                    validator: (value) => signUpProvider.passwordValidator(
                        value!,
                        hintPass: "Enter Your Password",
                        hintVaildPassword:
                            "Enter words and numbers at least 8"),
                    onChanged: (val) => signUpProvider.password = val,
                  ),
                  const SizedBox(height: 25),
                  CustomTextForm(
                    hint: "Re-enter Your Password",
                    icon: IconButton(
                        onPressed: () =>
                            signUpProvider.visibleConfirmPassword(),
                        icon: Icon(signUpProvider.isConfirmPassVisible
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    secureText: signUpProvider.isConfirmPassVisible,
                    enable: !signUpProvider.isLoading,
                    validator: (value) =>
                        signUpProvider.passwordConfirmValidator(value!,
                            hintPass: "Re-enter your Password",
                            hintNotMatch: "Passwords don't match"),
                    onChanged: (val) => signUpProvider.confirmPassword = val,
                  ),
                  const SizedBox(height: 35),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: signUpProvider.isLoading
                            ? null
                            : () => signUpProvider
                                .signUpWithEmailandPassword(context),
                        child: signUpProvider.isLoading
                            ? const AuthLoadingIndicator()
                            : const Text("Sign Up")),
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  const ClickHereLoginTextButton()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
