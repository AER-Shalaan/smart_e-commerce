import 'package:flutter/material.dart';
import 'package:smart_ecommerce/data/models/home_models/categories_model/category.dart';

class CategoryProvider extends ChangeNotifier {
  
  Category? selectedCategory;

  void setSelectedCategory(Category? category) {
    selectedCategory = category;
    notifyListeners();
  }
}