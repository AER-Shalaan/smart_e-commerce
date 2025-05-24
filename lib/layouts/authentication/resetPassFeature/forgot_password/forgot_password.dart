import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../core/resuebale_componants/custom_auth_textfield.dart';
import '../../../../core/resuebale_componants/headline_text.dart';
import '../../../../core/resuebale_componants/title_medium_text.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../Provider/forgot_password_provider.dart';
import 'send_code_button.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final FocusNode emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ForgotPasswordProvider>(context);

    return Scaffold(
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
                    const Headlinetext(text: "Forgot password"),
                    const SizedBox(height: 8),
                    const TitleMediumtext(
                      text:
                          "Enter your email for the verification process. We will send a 6-digit code to your email.",
                      opacity: 0.6,
                    ),
                    const SizedBox(height: 24),
                    const TitleMediumtext(text: "Email", opacity: 1),
                    const SizedBox(height: 4),
                    CustomAuthTextField(
                      hint: "email@example.com",
                      controller: emailController,
                      keyboard: TextInputType.emailAddress,
                      suffixIconConstraints: BoxConstraints.tight(
                        const Size(50, 30),
                      ),
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
                      borderColor:
                          provider.isEmailValid
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
    );
  }
}
