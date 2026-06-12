import 'package:flutter/material.dart';

class AdvProvider extends ChangeNotifier {
  int currentIndex = 0;
  void changeAdvCurrentIndex(int newValue) {
    if (currentIndex == newValue) return;
    currentIndex = newValue;
    notifyListeners();
  }
}
