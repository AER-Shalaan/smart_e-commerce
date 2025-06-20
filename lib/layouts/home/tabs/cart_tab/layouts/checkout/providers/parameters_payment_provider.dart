import 'package:flutter/material.dart';
import 'package:smart_ecommerce/data/models/address_model/address.dart';

class ParametersPaymentProvider extends ChangeNotifier {
  int? paymentMethodId;
  int? addressId;
  int? activeIndex;
  Address? selectedAddress;

  void setPaymentMethod(int id, int index) {
    paymentMethodId = id;
    activeIndex = index;
    notifyListeners();
  }

  void setAddress(int id, Address address) {
    addressId = id;
    selectedAddress = address;
    notifyListeners();
  }

  void clear() {
    paymentMethodId = null;
    addressId = null;
    selectedAddress = null;
    activeIndex = null;
    notifyListeners();
  }
}
