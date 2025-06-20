import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/resuebale_componants/custom_auth_textfield.dart';
import '../../../../core/resuebale_componants/custom_main_button.dart';
import '../Provider/reset_password_provider.dart';

class ResetPassword extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final resetPasswordProvider = Provider.of<ResetPasswordProvider>(context);
    final TextStyles = Theme.of(context).textTheme;
    passwordFocusNode.addListener(() {
      if (!passwordFocusNode.hasFocus) {
        resetPasswordProvider.validatePassword(passwordController.text);
      }
    });

    confirmPasswordFocusNode.addListener(() {
      if (!confirmPasswordFocusNode.hasFocus) {
        resetPasswordProvider.validateConfirmPassword(
          confirmPasswordController.text,
          passwordController.text,
        );
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(size: 33),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text("Reset Password",style: TextStyles.headlineSmall?.copyWith(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 8),
                   Text("Set the new password for your account so you can login and access all the features.",
                      style: TextStyles.titleMedium),
                  const SizedBox(height: 24),
                  Text("New Password",),
                  const SizedBox(height: 4),
                  CustomAuthTextField(
                    hint: "Enter your new password",
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    obscure: resetPasswordProvider.isPasswordObscure,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (resetPasswordProvider.isPassCheck)
                          SvgPicture.asset(Assets.assetsIconsCheck, height: 30),
                        if (resetPasswordProvider.isWrongPassword)
                          SvgPicture.asset(
                            Assets.assetsIconsWarningCircle,
                            height: 30,
                          ),
                        IconButton(
                          onPressed:
                              resetPasswordProvider.togglePasswordVisibility,
                          icon: SvgPicture.asset(
                            resetPasswordProvider.isPasswordObscure
                                ? Assets.assetsIconsEyeOff
                                : Assets.assetsIconsEye,
                          ),
                        ),
                      ],
                    ),
                    borderColor:
                        resetPasswordProvider.isPassCheck
                            ? Colors.green
                            : resetPasswordProvider.isWrongPassword
                            ? Colors.red
                            : AppColors.primary.withAlpha(102),
                  ),
                  if (resetPasswordProvider.isWrongPassword) ...[
                    const SizedBox(height: 8),
                    Text(
                      resetPasswordProvider.passwordErrorMessage,
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ],
                  const SizedBox(height: 16),
                  Text(
                    "Confirm New Password",
                    style: TextStyles.bodySmall,
                  ),
                  const SizedBox(height: 4),
                  CustomAuthTextField(
                    hint: "Re-enter your password",
                    controller: confirmPasswordController,
                    focusNode: confirmPasswordFocusNode,
                    obscure: resetPasswordProvider.isConfirmPasswordObscure,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (resetPasswordProvider.isConfirmPassCheck)
                          SvgPicture.asset(Assets.assetsIconsCheck, height: 30),
                        if (resetPasswordProvider.isWrongConfirmPass)
                          SvgPicture.asset(
                            Assets.assetsIconsWarningCircle,
                            height: 30,
                          ),
                        IconButton(
                          onPressed:
                              resetPasswordProvider
                                  .toggleConfirmPasswordVisibility,
                          icon: SvgPicture.asset(
                            resetPasswordProvider.isConfirmPasswordObscure
                                ? Assets.assetsIconsEyeOff
                                : Assets.assetsIconsEye,
                          ),
                        ),
                      ],
                    ),
                    borderColor:
                        resetPasswordProvider.isConfirmPassCheck
                            ? Colors.green
                            : resetPasswordProvider.isWrongConfirmPass
                            ? Colors.red
                            : AppColors.primary.withAlpha(102),
                  ),
                  // عرض رسالة الخطأ
                  if (resetPasswordProvider.isWrongConfirmPass) ...[
                    const SizedBox(height: 8),
                    Text(
                      resetPasswordProvider.confirmPasswordErrorMessage,
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ],
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomMainButton(
                label: "Continue",
                labelColor: Colors.white,
                buttonColor:
                    resetPasswordProvider.isFormValid
                        ? AppColors.secondary
                        : AppColors.secondary.withAlpha(180),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                onPressed:
                    resetPasswordProvider.isFormValid
                        ? () {
                          // TODO Handle submission logic
                        }
                        : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
