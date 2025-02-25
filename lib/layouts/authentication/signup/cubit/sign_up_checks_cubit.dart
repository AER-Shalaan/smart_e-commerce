import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/cubit/sign_up_checks_states.dart';
import '../../../../core/constants.dart';

class SignUpChecksCubit extends Cubit<SignUpChecksState> {
  SignUpChecksCubit() : super(InitialSignUpChecksState()) {
    initListeners();
  }
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passFocusNode = FocusNode();
  final FocusNode confirmPassFocusNode = FocusNode();
  void initListeners() {
    firstNameFocusNode.addListener(() {
      if (!firstNameFocusNode.hasFocus) {
        validateFirstName(firstNameController.text);
      }
    });
    lastNameFocusNode.addListener(() {
      if (!lastNameFocusNode.hasFocus) {
        validateLastName(lastNameController.text);
      }
    });
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
    confirmPassFocusNode.addListener(() {
      if (!confirmPassFocusNode.hasFocus) {
        validateConfirmPassword(
          confirmPassController.text,
          passController.text,
        );
      }
    });
  }

  void validateFirstName(String value) {
    bool isValid =
        value.isNotEmpty && RegExp(Constants.nameRegExp).hasMatch(value);
    emit(
      state.copyWith(
        isFNCheck: isValid,
        isWrongFirstName: value.isNotEmpty && !isValid,
      ),
    );
  }

  void validateLastName(String value) {
    bool isValid =
        value.isNotEmpty && RegExp(Constants.nameRegExp).hasMatch(value);
    emit(
      state.copyWith(
        isLNCheck: isValid,
        isWrongLastName: value.isNotEmpty && !isValid,
      ),
    );
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
        isWrongPass: value.isNotEmpty && !isValid,
      ),
    );
  }

  void validateConfirmPassword(String value, String password) {
    bool isValid = value.isNotEmpty && value == password;
    emit(
      state.copyWith(
        isConfirmPassCheck: isValid,
        isWrongConfirmPass: value.isNotEmpty && !isValid,
      ),
    );
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordObscure: !state.isPasswordObscure));
  }

  void toggleConfirmPasswordVisibility() {
    emit(
      state.copyWith(isConfirmPasswordObscure: !state.isConfirmPasswordObscure),
    );
  }

  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    emailFocusNode.dispose();
    passFocusNode.dispose();
    confirmPassFocusNode.dispose();
  }
}
