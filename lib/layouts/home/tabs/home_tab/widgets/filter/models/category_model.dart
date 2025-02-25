import 'package:flutter/material.dart';

class Category {
  final int id;
  final String name;
  final IconData icon;

  Category({required this.id, required this.name, required this.icon});

  static List<Category> dummyCategories = [
    Category(id: 1, name: 'Electronics', icon: Icons.devices),
    Category(id: 2, name: 'Clothes', icon: Icons.checkroom),
    Category(id: 3, name: 'Furniture', icon: Icons.chair),
  ];
}
