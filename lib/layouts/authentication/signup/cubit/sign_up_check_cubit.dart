import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/cubit/sign_up_check_states.dart';
import '../../../../core/constants.dart';
import 'package:flutter/material.dart';

class SignUpCheckCubit extends Cubit<SignUpCheckState> {
  SignUpCheckCubit() : super(const InitialSignUpCheckState());

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode phoneFoucsNode = FocusNode();

  final FocusNode passFocusNode = FocusNode();
  final FocusNode confirmPassFocusNode = FocusNode();
  void validateFirstName(String value) {
    emit(
      state.copyWith(
        isFNCheck:
            value.isNotEmpty && RegExp(Constants.nameRegExp).hasMatch(value),
        isWrongFirstName:
            value.isEmpty || !RegExp(Constants.nameRegExp).hasMatch(value),
      ),
    );
  }

  void validateLastName(String value) {
    emit(
      state.copyWith(
        isLNCheck:
            value.isNotEmpty && RegExp(Constants.nameRegExp).hasMatch(value),
        isWrongLastName:
            value.isEmpty || !RegExp(Constants.nameRegExp).hasMatch(value),
      ),
    );
  }

  void validateEmail(String value) {
    emit(
      state.copyWith(
        isEmailCheck:
            value.isNotEmpty && RegExp(Constants.emailRegExp).hasMatch(value),
        isWrongEmail:
            value.isEmpty || !RegExp(Constants.emailRegExp).hasMatch(value),
      ),
    );
  }

  void validatePhone(String value) {
    emit(
      state.copyWith(
        isPhoneCheck:
            value.isNotEmpty && RegExp(Constants.phoneRegExp).hasMatch(value),
        isWrongPhone:
            value.isEmpty || !RegExp(Constants.phoneRegExp).hasMatch(value),
      ),
    );
  }

  void validatePassword(String value) {
    emit(
      state.copyWith(
        isPassCheck:
            value.isNotEmpty && RegExp(Constants.passRegExp).hasMatch(value),
        isWrongPass:
            value.isEmpty || !RegExp(Constants.passRegExp).hasMatch(value),
      ),
    );
  }

  void validateConfirmPassword(String value, String password) {
    emit(
      state.copyWith(
        isConfirmPassCheck: value == password && value.isNotEmpty,
        isWrongConfirmPass: value != password || value.isEmpty,
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

  void resetPassData() {
    passController.clear();
    confirmPassController.clear();
    emit(
      state.copyWith(
        isConfirmPassCheck: false,
        isPassCheck: false,
        isWrongPass: false,
        isWrongConfirmPass: false,
      ),
    );
  }

  void resetSignUpData() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    phoneController.clear();
    resetPassData();
    emit(
      state.copyWith(
        isFNCheck: false,
        isLNCheck: false,
        isEmailCheck: false,
        isPhoneCheck: false,
        isWrongFirstName: false,
        isWrongLastName: false,
        isWrongEmail: false,
        isWrongPhone: false,
      ),
    );
  }
}
