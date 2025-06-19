import 'package:flutter/material.dart';

class ComparisonCategoryProvider extends ChangeNotifier {
  String _selectedCategory = 'laptops';
  String get selectedCategory => _selectedCategory;

  void setCategory(String newCategory) {
    _selectedCategory = newCategory;
    notifyListeners();
  }
}
