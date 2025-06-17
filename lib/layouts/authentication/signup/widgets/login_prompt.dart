import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/cubit/sign_up_check_cubit.dart';
import '../../../../core/utils/routes.dart';

class LoginPrompt extends StatelessWidget {
  const LoginPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RichText(
      text: TextSpan(
        text: 'Already have an account? ',
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.primary.withAlpha(153),
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Log In',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.primary,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.read<SignUpCheckCubit>().resetPassData();
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
