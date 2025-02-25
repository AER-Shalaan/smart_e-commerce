import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/cubit/sign_up_checks_cubit.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/cubit/sign_up_checks_states.dart';
import '../../../../core/constants.dart';
import '../../../../core/resuebale_componants/custom_auth_textfield.dart';
import '../../../../core/resuebale_componants/titleMediumText.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';

class SignUpTextFields extends StatelessWidget {
  const SignUpTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpChecksCubit, SignUpChecksState>(
      builder: (context, state) {
        var signUpChecksCubit = context.watch<SignUpChecksCubit>();
        var signUpChecksCubitReading = context.read<SignUpChecksCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleMediumtext(text: "First Name", opacity: 1),
            const SizedBox(height: 4),
            CustomAuthTextField(
              hint: "Ahmed",
              controller: signUpChecksCubit.firstNameController,
              focusNode: signUpChecksCubit.firstNameFocusNode,
              prefixIcon: const Icon(Icons.person_outline),
              suffixIcon:
                  state.isFNCheck
                      ? SvgPicture.asset(Assets.assetsIconsCheck)
                      : state.isWrongFirstName
                      ? SvgPicture.asset(Assets.assetsIconsWarningCircle)
                      : null,
              suffixIconConstraints: BoxConstraints.tight(const Size(50, 30)),
              borderColor:
                  state.isFNCheck
                      ? Colors.green
                      : state.isWrongFirstName
                      ? Colors.red
                      : AppColors.primary.withOpacity(0.4),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "This field can't be empty";
                }
                if (!RegExp(Constants.nameRegExp).hasMatch(value)) {
                  return "Please enter a valid name";
                }
                return null;
              },
              onChanged: (value) {
                signUpChecksCubit.validateFirstName(value);
              },
            ),
            const SizedBox(height: 16),
            const TitleMediumtext(text: "Last Name", opacity: 1),
            const SizedBox(height: 4),
            CustomAuthTextField(
              hint: "Mohammed",
              controller: signUpChecksCubit.lastNameController,
              focusNode: signUpChecksCubit.lastNameFocusNode,
              prefixIcon: const Icon(Icons.person_outline),
              suffixIcon:
                  state.isLNCheck
                      ? SvgPicture.asset(Assets.assetsIconsCheck)
                      : state.isWrongLastName
                      ? SvgPicture.asset(Assets.assetsIconsWarningCircle)
                      : null,
              suffixIconConstraints: BoxConstraints.tight(const Size(50, 30)),
              borderColor:
                  state.isLNCheck
                      ? Colors.green
                      : state.isWrongLastName
                      ? Colors.red
                      : AppColors.primary.withOpacity(0.4),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "This field can't be empty";
                }
                if (!RegExp(Constants.nameRegExp).hasMatch(value)) {
                  return "Please enter a valid name";
                }
                return null;
              },
              onChanged: (value) {
                signUpChecksCubit.validateLastName(value);
              },
            ),
            const SizedBox(height: 16),
            const TitleMediumtext(text: "Email", opacity: 1),
            const SizedBox(height: 4),
            CustomAuthTextField(
              hint: "email@example",
              controller: signUpChecksCubit.emailController,
              focusNode: signUpChecksCubit.emailFocusNode,
              keyboard: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email_outlined),
              suffixIcon:
                  state.isEmailCheck
                      ? SvgPicture.asset(Assets.assetsIconsCheck)
                      : state.isWrongEmail
                      ? SvgPicture.asset(Assets.assetsIconsWarningCircle)
                      : null,
              suffixIconConstraints: BoxConstraints.tight(const Size(50, 30)),
              borderColor:
                  state.isEmailCheck
                      ? Colors.green
                      : state.isWrongEmail
                      ? Colors.red
                      : AppColors.primary.withOpacity(0.4),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "This field can't be empty";
                }
                if (!RegExp(Constants.emailRegExp).hasMatch(value)) {
                  return "Please enter a valid email";
                }
                return null;
              },
              onChanged: (value) {
                signUpChecksCubit.validateEmail(value);
              },
            ),
            const SizedBox(height: 16),
            const TitleMediumtext(text: "Password", opacity: 1),
            const SizedBox(height: 4),
            CustomAuthTextField(
              hint: "Pass:A-Z,a-z,0-9",
              controller: signUpChecksCubit.passController,
              keyboard: TextInputType.visiblePassword,
              focusNode: signUpChecksCubit.passFocusNode,
              obscure: state.isPasswordObscure,
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (state.isPassCheck)
                    SvgPicture.asset(Assets.assetsIconsCheck, height: 30),
                  if (state.isWrongPass)
                    SvgPicture.asset(
                      Assets.assetsIconsWarningCircle,
                      height: 30,
                    ),
                  IconButton(
                    onPressed:
                        () =>
                            signUpChecksCubitReading.togglePasswordVisibility(),
                    icon: SvgPicture.asset(
                      state.isPasswordObscure
                          ? Assets.assetsIconsEyeOff
                          : Assets.assetsIconsEye,
                      colorFilter:
                          state.isPasswordObscure
                              ? const ColorFilter.mode(
                                Colors.black,
                                BlendMode.srcIn,
                              )
                              : const ColorFilter.mode(
                                AppColors.primary,
                                BlendMode.srcIn,
                              ),
                    ),
                  ),
                ],
              ),
              suffixIconConstraints: BoxConstraints.tight(const Size(80, 40)),
              borderColor:
                  state.isPassCheck
                      ? Colors.green
                      : state.isWrongPass
                      ? Colors.red
                      : AppColors.primary.withOpacity(0.4),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "This field can't be empty";
                }
                if (!RegExp(Constants.passRegExp).hasMatch(value)) {
                  return "Please enter a valid password";
                }
                return null;
              },
              onChanged: (value) {
                signUpChecksCubit.validatePassword(value);
              },
            ),
            const SizedBox(height: 16),
            const TitleMediumtext(text: "Confirm Password", opacity: 1),
            const SizedBox(height: 4),
            CustomAuthTextField(
              hint: "Re-enter your password",
              controller: signUpChecksCubit.confirmPassController,
              focusNode: signUpChecksCubit.confirmPassFocusNode,
              prefixIcon: const Icon(Icons.lock_outline),
              obscure: state.isConfirmPasswordObscure,
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (state.isConfirmPassCheck)
                    SvgPicture.asset(Assets.assetsIconsCheck, height: 30),
                  if (state.isWrongConfirmPass)
                    SvgPicture.asset(
                      Assets.assetsIconsWarningCircle,
                      height: 30,
                    ),
                  IconButton(
                    onPressed:
                        () =>
                            signUpChecksCubitReading
                                .toggleConfirmPasswordVisibility(),
                    icon: SvgPicture.asset(
                      state.isConfirmPasswordObscure
                          ? Assets.assetsIconsEyeOff
                          : Assets.assetsIconsEye,
                      colorFilter:
                          state.isConfirmPasswordObscure
                              ? const ColorFilter.mode(
                                Colors.black,
                                BlendMode.srcIn,
                              )
                              : const ColorFilter.mode(
                                AppColors.primary,
                                BlendMode.srcIn,
                              ),
                    ),
                  ),
                ],
              ),
              suffixIconConstraints: BoxConstraints.tight(const Size(80, 40)),
              borderColor:
                  state.isConfirmPassCheck
                      ? Colors.green
                      : state.isWrongConfirmPass
                      ? Colors.red
                      : AppColors.primary.withOpacity(0.4),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "This field can't be empty";
                }
                if (value != signUpChecksCubit.passController.text) {
                  return "Passwords do not match";
                }
                return null;
              },
              onChanged: (value) {
                signUpChecksCubit.validateConfirmPassword(
                  value,
                  signUpChecksCubit.passController.text,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
