import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndPoliciesAndCookiesText extends StatelessWidget {
  const TermsAndPoliciesAndCookiesText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RichText(
      text: TextSpan(
        text: 'By signing up you agree to our ',
        style: theme.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w400,
          color: theme.colorScheme.primary.withAlpha(153),
          fontSize: 14,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Terms',
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.primary,
              fontSize: 14,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          TextSpan(
            text: ', ',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.primary.withAlpha(153),
            ),
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.primary,
              fontSize: 14,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          TextSpan(
            text: ', and ',
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w400,
              color: theme.colorScheme.primary.withAlpha(153),
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: 'Cookie Use',
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.primary,
              fontSize: 14,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }
}
