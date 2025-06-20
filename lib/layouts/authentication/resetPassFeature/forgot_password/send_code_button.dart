import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/layouts/authentication/resetPassFeature/view_model/reset_passord_view_model.dart';

import '../../../../../core/resuebale_componants/custom_main_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../Provider/forgot_password_provider.dart';

class SendCodeButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;

  const SendCodeButton({
    super.key,
    required this.formKey,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ForgotPasswordProvider>(context);

    return CustomMainButton(
      label: 'Send Code',
      labelColor: Colors.white,
      buttonColor: provider.isEmailValid ? AppColors.secondary : Colors.grey,
      borderSide: BorderSide(
        color: provider.isEmailValid ? Colors.transparent : Colors.grey,
        width: 1,
      ),
      isDisabled: !provider.isEmailValid,
      onPressed:
          provider.isEmailValid
              ? () {
                if (formKey.currentState!.validate()) {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => Otp(email: emailController.text),
                  //   ),
                  // );
                  ResetPassordViewModel.get(
                    context,
                  ).sendOtp(email: emailController.text);
                }
              }
              : null,
    );
  }
}
