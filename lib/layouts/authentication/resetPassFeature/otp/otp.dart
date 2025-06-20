import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/resuebale_componants/app_snack_bar.dart';
import 'package:smart_ecommerce/core/resuebale_componants/custom_auth_textfield.dart';
import 'package:smart_ecommerce/core/resuebale_componants/custom_main_button.dart';
import 'package:smart_ecommerce/core/resuebale_componants/dialogs.dart';
import 'package:smart_ecommerce/core/utils/app_colors.dart';
import 'package:smart_ecommerce/core/utils/routes.dart';
import 'package:smart_ecommerce/layouts/authentication/resetPassFeature/otp/pin_input_form.dart';
import 'package:smart_ecommerce/layouts/authentication/resetPassFeature/otp/resend_code_text.dart';
import 'package:smart_ecommerce/layouts/authentication/resetPassFeature/view_model/reset_passord_view_model.dart';
import 'package:smart_ecommerce/layouts/authentication/resetPassFeature/view_model/reset_passord_view_model_state.dart';

class Otp extends StatefulWidget {
  final String email;

  const Otp({super.key, required this.email});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final TextEditingController pinController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<ResetPassordViewModel, ResetPassordViewModelState>(
      listenWhen:
          (previous, current) =>
              current is ResetPassordVerifyLoading ||
              current is ResetPassordVerifySuccess ||
              current is ResetPassordVerifyError,
      listener: (context, state) {
        if (state is ResetPassordVerifyLoading) {
          CustomDialogs.showLoadingDialog(context);
        } else {
          CustomDialogs.closeDialogs(context);
        }

        if (state is ResetPassordVerifySuccess) {
          CustomDialogs.showConfirmationDialog(
            context,
            title: 'Password Changed',
            content: 'Your password was successfully updated.',
            icon: Icons.check_circle_outline,
            iconColor: Colors.green,
            cancelLabel: 'Cancel',
            confirmationLabel: 'Login',
            confirmationColor: Colors.green,
            onConfirm: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.loginViewRouteName,
                (route) => false,
              );
            },
          );
        } else if (state is ResetPassordVerifyError) {
          CustomDialogs.showErrorDialog(context, state.error.message);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(size: 33),
          title: const Text("OTP"),
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
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Enter the 6 digit code that you received on your email ",
                            style: theme.textTheme.bodyLarge,
                          ),
                          TextSpan(
                            text: "(${widget.email})",
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    PinInputForm(controller: pinController),
                    const SizedBox(height: 16),
                    Center(child: ResendCodeText(email: widget.email)),
                    const SizedBox(height: 16),
                    CustomAuthTextField(
                      hint: "Enter your new Password",
                      controller: passwordController,
                      borderColor: AppColors.secondary,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "password can't be empty";
                        }
                        if (value.length != 8) {
                          return "password must be 8 digits";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    CustomAuthTextField(
                      hint: "Confirm your new Password",
                      controller: confirmPasswordController,
                      borderColor: AppColors.secondary,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "password can't be empty";
                        }
                        if (value != passwordController.text) {
                          return "passwords do not match";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomMainButton(
                  label: "Continue",
                  labelColor: Colors.white,
                  buttonColor: AppColors.secondary,
                  borderSide: const BorderSide(color: Colors.transparent),
                  isDisabled: false,
                  onPressed: () {
                    if (pinController.text.isEmpty) {
                      return AppSnackBar.show(
                        context: context,
                        message: "OTP can't be empty!",
                        icon: Icons.error_outline,
                        backgroundColor: Colors.redAccent,
                        fromTop: false,
                      );
                    }

                    if (pinController.text.length < 6) {
                      return AppSnackBar.show(
                        context: context,
                        message: "OTP must be 6 digits!",
                        icon: Icons.error_outline,
                        backgroundColor: Colors.redAccent,
                        fromTop: false,
                      );
                    }

                    ResetPassordViewModel.get(context).verifyOtp(
                      email: widget.email,
                      otp: pinController.text,
                      newPassword: passwordController.text,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
