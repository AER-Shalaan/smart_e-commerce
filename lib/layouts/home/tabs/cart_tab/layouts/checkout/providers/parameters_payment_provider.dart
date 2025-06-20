import 'package:flutter/material.dart';

class ParametersPaymentProvider extends ChangeNotifier {
  int? paymentMethodId;
  int? addressId;
  int? activeIndex;

  void setPaymentMethod(int id, int index) {
    paymentMethodId = id;
    activeIndex = index;
    notifyListeners();
  }

  void setActiveIndex(int index) {
    activeIndex = index;
    notifyListeners();
  }

  void setAddress(int id) {
    addressId = id;
    notifyListeners();
  }

  void clear() {
    paymentMethodId = null;
    addressId = null;
    activeIndex = null;
    notifyListeners();
  }
}
