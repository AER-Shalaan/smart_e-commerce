import 'package:flutter/material.dart';

import '../demo/list_of_cart_items.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = List.from(originalCartItems);

  List<Map<String, dynamic>> get cartItems => _cartItems;

  bool get isCartEmpty => _cartItems.isEmpty;
 
  void addItem(Map<String, dynamic> item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void updateQuantity(int index, int quantity) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems[index]['quantity'] = quantity;
      notifyListeners();
    }
  }


  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
