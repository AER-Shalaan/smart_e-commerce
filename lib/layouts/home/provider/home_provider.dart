import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int homeTapIndex = 0;
  changeHomeTapIndex({required int newValue}) {
    if (newValue == homeTapIndex) {
      return;
    }
    homeTapIndex = newValue;
    notifyListeners();
  }

  int selectedCatedgoryIndex = 0;
  changeSelectedCatedgoryIndex({required int newValue}) {
    if (selectedCatedgoryIndex == newValue) {
      return;
    }
    selectedCatedgoryIndex = newValue;
    notifyListeners();
  }
}
