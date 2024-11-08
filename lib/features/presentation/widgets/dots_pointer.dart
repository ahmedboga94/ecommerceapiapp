import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class DotsPointer extends StatelessWidget {
  final List itemsList;
  final int activeDot;
  const DotsPointer(
      {super.key, required this.itemsList, required this.activeDot});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          itemsList.length,
          (index) => AnimatedContainer(
            margin: const EdgeInsets.only(right: 6),
            duration: const Duration(milliseconds: 400),
            width: activeDot == index ? 22 : 8,
            height: 8,
            decoration: BoxDecoration(
                color: activeDot == index
                    ? AppColors.primeColor
                    : AppColors.geryColor,
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
