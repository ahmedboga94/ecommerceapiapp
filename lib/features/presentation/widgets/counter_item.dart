import 'package:flutter/material.dart';

import '../../../core/constants/app_text_styles.dart';

class CounterItem extends StatelessWidget {
  final int quantityNum;
  final Function()? decrementFunc, incrementFunc;
  const CounterItem(
      {super.key,
      this.decrementFunc,
      this.incrementFunc,
      required this.quantityNum});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: decrementFunc,
            icon: const Icon(Icons.remove_circle, color: Colors.orange)),
        SizedBox(
          width: 20,
          child: Center(
            child: Text("$quantityNum",
                maxLines: 1, style: AppTextStyles.smallBold),
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: incrementFunc,
          icon: const Icon(Icons.add_circle, color: Colors.green),
        )
      ],
    );
  }
}
