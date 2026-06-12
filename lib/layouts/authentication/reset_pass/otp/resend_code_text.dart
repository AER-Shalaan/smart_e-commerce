import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';
import '../view_model/reset_passord_view_model.dart';

class ResendCodeText extends StatelessWidget {
  final String email;

  const ResendCodeText({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Email not received? ',
        style: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          color: AppColors.primary.withAlpha(153),
          fontSize: 14,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Resend code',
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
              fontSize: 14,
              decoration: TextDecoration.underline,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    ResetPassordViewModel.get(context).sendOtp(email: email);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Resend request sent')),
                    );
                  },
          ),
        ],
      ),
    );
  }
}
