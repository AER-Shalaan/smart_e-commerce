import 'package:flutter/material.dart';
import '../../../../core/constants.dart';

class ResetPasswordProvider with ChangeNotifier {
  bool isPassCheck = false;
  bool isConfirmPassCheck = false;
  bool isWrongPassword = false;
  bool isWrongConfirmPass = false;
  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;
  String passwordErrorMessage = "";
  String confirmPasswordErrorMessage = "";

  bool get isFormValid => isPassCheck && isConfirmPassCheck;

  void validatePassword(String value) {
    passwordErrorMessage = "";

    if (value.isEmpty) {
      isWrongPassword = true;
      passwordErrorMessage = "Password cannot be empty";
    } else if (value.length < 8) {
      isWrongPassword = true;
      passwordErrorMessage = "Password must be at least 8 characters long";
    } else if (!RegExp(Constants.passRegExp).hasMatch(value)) {
      isWrongPassword = true;
      passwordErrorMessage = "Password must contain an uppercase letter, a number, and a special character (e.g., !@#\$%^&*)";
    } else {
      isWrongPassword = false;
    }

    isPassCheck = !isWrongPassword;
    notifyListeners();
  }

  void validateConfirmPassword(String value, String password) {
    confirmPasswordErrorMessage = "";

    if (value.isEmpty) {
      isWrongConfirmPass = true;
      confirmPasswordErrorMessage = "Confirm password cannot be empty";
    } else if (value != password) {
      isWrongConfirmPass = true;
      confirmPasswordErrorMessage = "Passwords do not match";
    } else {
      isWrongConfirmPass = false;
    }

    isConfirmPassCheck = !isWrongConfirmPass;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    isPasswordObscure = !isPasswordObscure;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordObscure = !isConfirmPasswordObscure;
    notifyListeners();
  }

  void validatePasswordOnExit(String value) {
    validatePassword(value);
  }

  void validateConfirmPasswordOnExit(String value, String password) {
    validateConfirmPassword(value, password);
  }
}