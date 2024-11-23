import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/app_text_styles.dart';

import '../../../../../core/di/init_di.dart';
import '../../../provider/auth/verfiy_code_provider.dart';
import 'widgets/verfiy_code_view_body.dart';

class VerfiyCodeView extends StatelessWidget {
  final String email;
  const VerfiyCodeView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChangeNotifier>(
      create: (context) => di<VerfiyCodeProvider>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Verfiy Code", style: AppTextStyles.largeRegular),
        ),
        body: VerfiyCodeViewBody(email: email),
      ),
    );
  }
}
