import 'package:flutter/material.dart';

class AuthLoadingIndicator extends StatelessWidget {
  const AuthLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
