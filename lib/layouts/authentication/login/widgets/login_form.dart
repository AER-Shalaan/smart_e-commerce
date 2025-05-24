import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/authentication/login/widgets/login_button.dart';
import 'package:smart_ecommerce/layouts/authentication/login/widgets/social_login_buttons.dart';
import '../../../../core/resuebale_componants/headline_text.dart';
import '../../../../core/resuebale_componants/title_medium_text.dart';
import 'forgot_password_text.dart';
import 'login_text_fields.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Headlinetext(text: "Login to your account"),
          const TitleMediumtext(
            text: "It’s great to see you again.",
            opacity: 0.6,
          ),
          const SizedBox(height: 24),
          LoginTextFields(),
          const SizedBox(height: 10),
          const ForgotPasswordText(),
          const SizedBox(height: 24),
          LoginButton(formKey: formKey),
          const SizedBox(height: 24),
          const SocialLoginButtons(),
        ],
      ),
    );
  }
}
