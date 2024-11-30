import 'package:flutter/material.dart';

import 'widgets/search_and_notifications.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Column(
            children: [
              SearchAndNotifications(),
              Center(
                child: Text("Home View"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
