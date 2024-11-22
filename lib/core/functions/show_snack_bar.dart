import 'package:ecommerceapiapp/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

showSnackBar(BuildContext context,
    {required String msg, IconData icon = Icons.info_outline}) {
  return ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.whiteColor),
            const SizedBox(width: 14),
            Expanded(child: Text(msg)),
          ],
        ),
        backgroundColor: AppColors.primeColor,
        shape: const StadiumBorder(),
        margin: const EdgeInsets.all(22),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ),
    );
}
