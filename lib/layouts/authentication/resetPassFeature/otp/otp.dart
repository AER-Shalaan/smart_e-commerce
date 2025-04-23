import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/authentication/resetPassFeature/otp/pin_input_form.dart';
import 'package:smart_ecommerce/layouts/authentication/resetPassFeature/otp/resend_code_text.dart';
import '../../../../core/resuebale_componants/custom_main_button.dart';
import '../../../../core/resuebale_componants/headlineText.dart';
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Row(
                          children: [
                            Icon(Icons.error_outline, color: Colors.white),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "OTP Can't be empty!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        backgroundColor: Colors.redAccent,
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(seconds: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.all(20),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Row(
                          children: [
                            Icon(Icons.error_outline, color: Colors.white),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "Invalid OTP! Please check the code and try again.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        backgroundColor: Colors.redAccent,
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(seconds: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 10,
                        ),
                      ),
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
