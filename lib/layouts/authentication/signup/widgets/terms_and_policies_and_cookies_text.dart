import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/app_colors.dart';

class TermsAndPoliciesAndCookiesText extends StatelessWidget {
  const TermsAndPoliciesAndCookiesText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'By signing up you agree to our ',
        style: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          color: AppColors.primary.withOpacity(0.6),
          fontSize: 14,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Terms',
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
              fontSize: 14,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {

            },
          ),
          TextSpan(
            text: ', ',
            style: TextStyle(color: AppColors.primary.withOpacity(0.6)),
          ),

          TextSpan(
            text: 'Privacy Policy',
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
              fontSize: 14,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {

            },
          ),
          TextSpan(
            text: ', and ',
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w400,
              color: AppColors.primary.withOpacity(0.6),
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: 'Cookie Use',
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
              fontSize: 14,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {
              // Reset password functionality
            },
          ),
        ],
      ),
    );
  }
}
