import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Subcategory {
  final int id;
  final String name;
  final int categoryId;
  final IconData icon;

  Subcategory({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.icon,
  });

  static List<Subcategory> dummySubcategories = [
    Subcategory(
      id: 1,
      name: 'Smart Phones',
      categoryId: 1,
      icon: Icons.phone_android,
    ),
    Subcategory(id: 2, name: 'Laptops', categoryId: 1, icon: Icons.laptop),
    Subcategory(
      id: 3,
      name: 'Shirts',
      categoryId: 2,
      icon: FontAwesomeIcons.shirt,
    ),
    Subcategory(
      id: 4,
      name: 'Headphones',
      categoryId: 1,
      icon: Icons.headphones,
    ),
    Subcategory(
      id: 5,
      name: 'Socks',
      categoryId: 2,
      icon: FontAwesomeIcons.socks,
    ),
    Subcategory(
      id: 6,
      name: 'Couches',
      categoryId: 3,
      icon: FontAwesomeIcons.couch,
    ),
    Subcategory(id: 7, name: 'Beds', categoryId: 3, icon: FontAwesomeIcons.bed),
    Subcategory(id: 8, name: 'Tablets', categoryId: 1, icon: Icons.tablet),
  ];
}
