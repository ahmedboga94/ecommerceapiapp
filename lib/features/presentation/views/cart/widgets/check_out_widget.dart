import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';

class CheckOutWidget extends StatelessWidget {
  final String totalNumItems;
  final double totalPrice;
  final Function() checkFunc;

  const CheckOutWidget(
      {super.key,
      required this.totalNumItems,
      required this.totalPrice,
      required this.checkFunc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Total Price: ",
                  style: AppTextStyles.headLineBold,
                ),
                Text(
                  totalNumItems,
                  style: AppTextStyles.regular,
                )
              ],
            ),
            trailing: Text(
              "${totalPrice.toStringAsFixed(2)} EGP",
              style: AppTextStyles.bold
                  .copyWith(color: AppColors.primeColor, fontSize: 20),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: ListTile(
            onTap: checkFunc,
            tileColor: AppColors.primeColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Center(
              child: Text(
                "Checkout",
                style: AppTextStyles.headLineBold
                    .copyWith(color: AppColors.whiteColor),
              ),
            ),
          ),
        )
      ],
    );
  }
}
