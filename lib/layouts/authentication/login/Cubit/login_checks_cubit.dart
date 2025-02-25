import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/constants.dart';
import 'login_checks_states.dart';

class LoginChecksCubit extends Cubit<LoginChecksState> {
  LoginChecksCubit() : super(const InitialLoginChecksState()) {
    initListeners();
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passFocusNode = FocusNode();

  void initListeners() {
    emailController.addListener(() => validateEmail(emailController.text));
    passController.addListener(() => validatePassword(passController.text));

    emailFocusNode.addListener(() {
      if (!emailFocusNode.hasFocus) {
        validateEmail(emailController.text);
      }
    });

    passFocusNode.addListener(() {
      if (!passFocusNode.hasFocus) {
        validatePassword(passController.text);
      }
    });
  }

  void validateEmail(String value) {
    bool isValid =
        value.isNotEmpty && RegExp(Constants.emailRegExp).hasMatch(value);
    emit(
      state.copyWith(
        isEmailCheck: isValid,
        isWrongEmail: value.isNotEmpty && !isValid,
      ),
    );
  }

  void validatePassword(String value) {
    bool isValid =
        value.isNotEmpty && RegExp(Constants.passRegExp).hasMatch(value);
    emit(
      state.copyWith(
        isPassCheck: isValid,
        isWrongPassword: value.isNotEmpty && !isValid,
      ),
    );
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordObscure: !state.isPasswordObscure));
  }

  void resetLoginData() {
    emailController.clear();
    passController.clear();
    emit(state.copyWith(isEmailCheck: false, isPassCheck: false));
  }
}
