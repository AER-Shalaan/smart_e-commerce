import 'package:flutter/material.dart';
import '../../../../core/constants.dart';
class ForgotPasswordProvider extends ChangeNotifier {
  bool _isEmailValid = false;
  String emailErrorMessage = "";

  bool get isEmailValid => _isEmailValid;

  void validateEmail(String email) {
    emailErrorMessage = "";

    if (email.isEmpty) {
      _isEmailValid = false;
      emailErrorMessage = "Email cannot be empty";
    } else if (!RegExp(Constants.emailRegExp).hasMatch(email)) {
      _isEmailValid = false;
      emailErrorMessage = "Please enter a valid email address";
    } else {
      _isEmailValid = true;
    }

    notifyListeners();
  }

  void reset() {
    _isEmailValid = false;
    emailErrorMessage = "";
    notifyListeners();
  }
}
