import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/routes.dart';

class SignUpPrompt extends StatelessWidget {
  const SignUpPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RichText(
      text: TextSpan(
        text: 'Don’t have an account? ',
        style: theme.textTheme.bodyMedium?.copyWith(
          color: AppColors.primary.withAlpha(153),
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: 'Join',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.signUpViewRouteName,
                );
              },
          ),
        ],
      ),
    );
  }
}
