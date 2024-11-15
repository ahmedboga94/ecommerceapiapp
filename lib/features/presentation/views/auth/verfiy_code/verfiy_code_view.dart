import 'package:flutter/material.dart';

import '../../../../../core/constants/app_text_styles.dart';

class VerfiyCodeView extends StatelessWidget {
  const VerfiyCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verfiy Code", style: AppTextStyles.largeRegular),
      ),
    );
  }
}
