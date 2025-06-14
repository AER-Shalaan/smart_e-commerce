import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/resuebale_componants/headline_text.dart';
import 'package:smart_ecommerce/core/resuebale_componants/title_medium_text.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/cubit/sign_up_check_cubit.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/widgets/sign_up_button.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/widgets/signup_text_fields.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/widgets/social_signup_buttons.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/widgets/terms_and_policies_and_cookies_text.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SignUpForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    var signUpChecksCubit = context.watch<SignUpCheckCubit>();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Headlinetext(text: "Create an account"),
          const TitleMediumtext(
            text: "Let’s create your account.",
            opacity: 0.6,
          ),
          const SizedBox(height: 24),
          const SignUpTextFields(),
          const SizedBox(height: 10),
          const TermsAndPoliciesAndCookiesText(),
          const SizedBox(height: 24),
          SignUpButton(
            formKey: formKey,
            buyerName: [
              signUpChecksCubit.firstNameController.text,
              signUpChecksCubit.lastNameController.text,
            ].where((text) => text.isNotEmpty).join(' '),
            email: signUpChecksCubit.emailController.text,
            password: signUpChecksCubit.passController.text,
            phone: signUpChecksCubit.phoneController.text,
          ),
          const SizedBox(height: 24),
          const SocialSignUpButtons(),
        ],
      ),
    );
  }
}
