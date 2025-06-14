import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/resuebale_componants/app_snack_bar.dart';
import 'package:smart_ecommerce/core/resuebale_componants/headline_text.dart';
import 'package:smart_ecommerce/layouts/authentication/resetPassFeature/otp/pin_input_form.dart';
import 'package:smart_ecommerce/layouts/authentication/resetPassFeature/otp/resend_code_text.dart';
import '../../../../core/resuebale_componants/custom_main_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/routes.dart';

class Otp extends StatefulWidget {
  final String email;

  const Otp({super.key, required this.email});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  String validPin = "123456";
  final TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  const Headlinetext(text: "Enter 6 Digit Code"),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "Enter the 4 digit code that you received on your email ",
                          style: Theme.of(context).textTheme.titleMedium,
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
                  const Center(child: ResendCodeText()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomMainButton(
                label: "Continue",
                labelColor: Colors.white,
                buttonColor: AppColors.secondary,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                isDisabled: false,
                onPressed: () {
                  if (pinController.text == validPin) {
                    Navigator.pushNamed(context, Routes.resetPasswordRouteName);
                    //TODO: respond from Farag
                  } else if (pinController.text == "") {
                    return AppSnackBar.show(
                      context: context,
                      message: "OTP Can't be empty!",
                      icon: Icons.error_outline,
                      backgroundColor: Colors.redAccent,
                      fromTop: false,
                    );
                  } else {
                    return AppSnackBar.show(
                      context: context,
                      message: "Wrong OTP!",
                      icon: Icons.error_outline,
                      backgroundColor: Colors.redAccent,
                      fromTop: false,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
