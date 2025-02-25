import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_up_checks_states.dart';
import '../../../../core/constants.dart';
import 'package:flutter/material.dart';

class SignUpChecksCubit extends Cubit<SignUpChecksState> {
  SignUpChecksCubit() : super(const InitialSignUpChecksState());

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
}
