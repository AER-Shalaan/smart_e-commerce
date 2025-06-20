import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/core/resuebale_componants/custom_auth_textfield.dart';
import 'package:smart_ecommerce/core/resuebale_componants/dialogs.dart';
import 'package:smart_ecommerce/core/utils/app_colors.dart';
import 'package:smart_ecommerce/core/utils/assets.dart';
import 'package:smart_ecommerce/layouts/authentication/resetPassFeature/otp/otp.dart';
import '../Provider/forgot_password_provider.dart';
import '../view_model/reset_passord_view_model.dart';
import '../view_model/reset_passord_view_model_state.dart';
import 'send_code_button.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final FocusNode emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ForgotPasswordProvider>(context);
    final textStyles = Theme.of(context).textTheme;

    return BlocListener<ResetPassordViewModel, ResetPassordViewModelState>(
      listener: (context, state) {
        /// ✅ الحالات الخاصة بـ إرسال OTP فقط
        if (state is ResetPassordSendOtpLoading) {
          CustomDialogs.showLoadingDialog(context);
        } else if (state is ResetPassordSendOtpSuccess) {
          CustomDialogs.closeDialogs(context);

          // التنقل إلى شاشة OTP بعد النجاح
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Otp(email: emailController.text),
            ),
          );
        } else if (state is ResetPassordSendOtpError) {
          CustomDialogs.closeDialogs(context);
          CustomDialogs.showErrorDialog(context, state.error.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(size: 33),
        ),
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Forgot password",
                        style: textStyles.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Enter your email for the verification process. We will send a 6-digit code to your email.",
                        style: textStyles.titleMedium,
                      ),
                      const SizedBox(height: 24),
                      const Text("Email"),
                      const SizedBox(height: 4),
                      CustomAuthTextField(
                        hint: "email@example.com",
                        controller: emailController,
                        keyboard: TextInputType.emailAddress,
                        suffixIconConstraints:
                            BoxConstraints.tight(const Size(50, 30)),
                        prefixIcon: const Icon(Icons.email_outlined),
                        suffixIcon: Row(
                          children: [
                            if (provider.isEmailValid)
                              SvgPicture.asset(
                                Assets.assetsIconsCheck,
                                height: 30,
                              ),
                            if (!provider.isEmailValid &&
                                provider.emailErrorMessage.isNotEmpty)
                              SvgPicture.asset(
                                Assets.assetsIconsWarningCircle,
                                height: 30,
                              ),
                          ],
                        ),
                        borderColor: provider.isEmailValid
                            ? Colors.green
                            : provider.emailErrorMessage.isNotEmpty
                                ? Colors.red
                                : AppColors.primary.withAlpha(102),
                        onChanged: (value) {},
                        focusNode: emailFocusNode,
                        validator: (value) {
                          if (!provider.isEmailValid) {
                            return provider.emailErrorMessage;
                          }
                          return null;
                        },
                        onEditingComplete: () {
                          provider.validateEmail(emailController.text);
                        },
                        errorMessage: provider.emailErrorMessage,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SendCodeButton(
                    formKey: formKey,
                    emailController: emailController,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
