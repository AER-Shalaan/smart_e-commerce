import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_ecommerce/core/resuebale_componants/custom_auth_textfield.dart';
import 'package:smart_ecommerce/core/resuebale_componants/title_medium_text.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/cubit/sign_up_check_cubit.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/cubit/sign_up_check_states.dart';
import '../../../../core/constants.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';

class SignUpTextFields extends StatelessWidget {
  const SignUpTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCheckCubit, SignUpCheckState>(
      builder: (context, state) {
        var cubit = context.read<SignUpCheckCubit>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField(
              context: context,
              title: "First Name",
              hint: "Ahmed",
              controller: cubit.firstNameController,
              focusNode: cubit.firstNameFocusNode,
              prefixIcon: const Icon(Icons.person_outline),
              isValid: state.isFNCheck,
              isWrong: state.isWrongFirstName,
              validator: (value) => _validateName(value, "First Name"),
              onChanged: cubit.validateFirstName,
            ),
            const SizedBox(height: 16),
            buildTextField(
              context: context,
              title: "Last Name",
              hint: "Mohammed",
              controller: cubit.lastNameController,
              focusNode: cubit.lastNameFocusNode,
              prefixIcon: const Icon(Icons.person_outline),
              isValid: state.isLNCheck,
              isWrong: state.isWrongLastName,
              validator: (value) => _validateName(value, "Last Name"),
              onChanged: cubit.validateLastName,
            ),
            const SizedBox(height: 16),
            buildTextField(
              context: context,
              title: "Email",
              hint: "email@example.com",
              controller: cubit.emailController,
              focusNode: cubit.emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email_outlined),
              isValid: state.isEmailCheck,
              isWrong: state.isWrongEmail,

              /////////Change to Phone logic////////
              validator: (value) => _validateEmail(value),
              onChanged: cubit.validateEmail,
            ),
            const SizedBox(height: 16),
            buildTextField(
              context: context,
              title: "Phone",
              hint: "0123456789",
              controller: cubit.phoneController,
              focusNode: cubit.phoneFoucsNode,
              keyboardType: TextInputType.phone,
              prefixIcon: const Icon(Icons.call_outlined),
              isValid: state.isPhoneCheck,
              isWrong: state.isWrongPhone,
              validator: (value) => _validatePhone(value),
              onChanged: cubit.validatePhone,
            ),

            const SizedBox(height: 16),
            buildPasswordTextField(
              context: context,
              title: "Password",
              hint: "Pass:A-Z,a-z,0-9",
              controller: cubit.passController,
              focusNode: cubit.passFocusNode,
              isObscure: state.isPasswordObscure,
              isValid: state.isPassCheck,
              isWrong: state.isWrongPass,
              toggleVisibility: cubit.togglePasswordVisibility,
              validator: (value) => _validatePassword(value),
              onChanged: cubit.validatePassword,
            ),
            const SizedBox(height: 16),
            buildPasswordTextField(
              context: context,
              title: "Confirm Password",
              hint: "Re-enter your password",
              controller: cubit.confirmPassController,
              focusNode: cubit.confirmPassFocusNode,
              isObscure: state.isConfirmPasswordObscure,
              isValid: state.isConfirmPassCheck,
              isWrong: state.isWrongConfirmPass,
              toggleVisibility: cubit.toggleConfirmPasswordVisibility,
              validator:
                  (value) => _validateConfirmPassword(
                    value,
                    cubit.passController.text,
                  ),
              onChanged:
                  (value) => cubit.validateConfirmPassword(
                    cubit.passController.text,
                    value,
                  ),
            ),
          ],
        );
      },
    );
  }

  Widget buildTextField({
    required BuildContext context,
    required String title,
    required String hint,
    required TextEditingController controller,
    required FocusNode focusNode,
    required Icon prefixIcon,
    required bool isValid,
    required bool isWrong,
    required String? Function(String?) validator,
    required Function(String) onChanged,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleMediumtext(text: title, opacity: 1),
        const SizedBox(height: 4),
        CustomAuthTextField(
          hint: hint,
          controller: controller,
          focusNode: focusNode,
          keyboard: keyboardType,
          prefixIcon: prefixIcon,
          suffixIcon:
              isValid
                  ? SvgPicture.asset(Assets.assetsIconsCheck)
                  : isWrong
                  ? SvgPicture.asset(Assets.assetsIconsWarningCircle)
                  : null,
          suffixIconConstraints: BoxConstraints.tight(const Size(50, 30)),
          borderColor:
              isValid
                  ? Colors.green
                  : isWrong
                  ? Colors.red
                  : AppColors.primary.withAlpha(102),
          validator: validator,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget buildPasswordTextField({
    required BuildContext context,
    required String title,
    required String hint,
    required TextEditingController controller,
    required FocusNode focusNode,
    required bool isObscure,
    required bool isValid,
    required bool isWrong,
    required VoidCallback toggleVisibility,
    required String? Function(String?) validator,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleMediumtext(text: title, opacity: 1),
        const SizedBox(height: 4),
        CustomAuthTextField(
          hint: hint,
          controller: controller,
          focusNode: focusNode,
          obscure: isObscure,
          prefixIcon: const Icon(Icons.lock_outline),
          suffixIcon: IconButton(
            onPressed: toggleVisibility,
            icon: SvgPicture.asset(
              isObscure ? Assets.assetsIconsEyeOff : Assets.assetsIconsEye,
            ),
          ),
          borderColor:
              isValid
                  ? Colors.green
                  : isWrong
                  ? Colors.red
                  : AppColors.primary.withAlpha(102),
          validator: validator,
          onChanged: onChanged,
        ),
      ],
    );
  }

  String? _validateName(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return "$fieldName can't be empty";
    }
    if (!RegExp(Constants.nameRegExp).hasMatch(value)) {
      return "Please enter a valid $fieldName";
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email can't be empty";
    if (!RegExp(Constants.emailRegExp).hasMatch(value)) return "Invalid email";
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) return "Phone can't be empty";
    if (!RegExp(Constants.phoneRegExp).hasMatch(value)) return "Invalid phone";
    return null;
  }

  String? _validatePassword(String? value) {
    return value != null && value.isNotEmpty ? null : "Password can't be empty";
  }

  String? _validateConfirmPassword(String? value, String password) {
    return value == password ? null : "Passwords do not match";
  }
}
