import 'package:flutter/material.dart';

import '../../../widgets/custom_text_form.dart';

class SearchAndNotifications extends StatelessWidget {
  const SearchAndNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(18)),
          child: const CustomTextForm(
            hint: "Search",
            icon: Icon(Icons.search),
          ),
        )),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(18)),
          child: IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
        )
      ],
    );
  }
}
