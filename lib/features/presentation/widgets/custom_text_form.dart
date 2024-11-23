import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String hint;
  final String? initialValue;
  final bool secureText;
  final bool? enable;
  final Widget icon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextForm(
      {super.key,
      required this.hint,
      required this.icon,
      this.initialValue,
      this.secureText = false,
      this.enable = true,
      this.controller,
      this.onChanged,
      this.validator,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable,
      initialValue: initialValue,
      controller: controller,
      onChanged: onChanged,
      obscureText: secureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        label: Text(hint),
        contentPadding: const EdgeInsets.symmetric(horizontal: 22),
        suffixIcon: icon,
      ),
    );
  }
}
