import 'package:flutter/material.dart';

class OnBoardingProvider extends ChangeNotifier {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  int get currentPage => _currentPage;
  PageController get pageController => _pageController;

  void onPageChanged(int index) {
    _currentPage = index;
    notifyListeners();
  }

  void animateTo() {
    _currentPage++;

    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
