import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/authentication/login/widgets/login_button.dart';
import 'package:smart_ecommerce/layouts/authentication/login/widgets/social_login_buttons.dart';
import 'login_text_fields.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Login to your account",
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "It’s great to see you again.",
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.textTheme.titleMedium?.color?.withAlpha(153),
            ),
          ),
          const SizedBox(height: 24),
          const LoginTextFields(),
          const SizedBox(height: 24),
          LoginButton(formKey: formKey),
          const SizedBox(height: 24),
          const SocialLoginButtons(),
        ],
      ),
    );
  }
}
