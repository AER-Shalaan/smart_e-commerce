import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/cubit/sign_up_checks_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/routes.dart';

class LoginPrompt extends StatelessWidget {
  const LoginPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Already have an account? ',
        style: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          color: AppColors.primary.withOpacity(0.6),
          fontSize: 16,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Log In',
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
              fontSize: 16,
              decoration: TextDecoration.underline,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    context.read<SignUpChecksCubit>().resetPassData();
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.loginViewRouteName,
                    );
                  },
          ),
        ],
      ),
    );
  }
}
