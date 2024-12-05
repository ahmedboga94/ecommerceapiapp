import 'package:flutter/material.dart';

class MainViewProvider with ChangeNotifier {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  int get currentPage => _currentPage;
  PageController get pageController => _pageController;

  void setPage(int index) {
    _currentPage = index;
    notifyListeners();
  }

  void animateTo(int index, {int animateTime = 10}) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: animateTime),
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
