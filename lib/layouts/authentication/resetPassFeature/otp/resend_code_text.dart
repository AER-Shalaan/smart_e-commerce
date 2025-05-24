import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utils/app_colors.dart';

class ResendCodeText extends StatelessWidget {
  const ResendCodeText({super.key});

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
                    //TODO
                  },
          ),
        ],
      ),
    );
  }
}
