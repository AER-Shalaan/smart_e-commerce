import 'package:flutter/material.dart';

class AdvProvider extends ChangeNotifier {
  double currentIndex = 0;
  changeAdvCurrentIndex(double newValue) {
    if (currentIndex == newValue) return;
    currentIndex = newValue;
    notifyListeners();
  }
}
