import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/cubit/sign_up_check_cubit.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/cubit/sign_up_check_states.dart';
import '../view_model/sign_up_view_model.dart';
import '../../../../core/resuebale_componants/custom_main_button.dart';

class SignUpButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String buyerName;
  final String email;
  final String password;
  final String phone;

  const SignUpButton({
    super.key,
    required this.formKey,
    required this.buyerName,
    required this.email,
    required this.password,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<SignUpCheckCubit, SignUpCheckState>(
      builder: (context, state) {
        final isFormValid =
            state.isFNCheck &&
            state.isLNCheck &&
            state.isEmailCheck &&
            state.isPassCheck &&
            state.isConfirmPassCheck;

        return CustomMainButton(
          label: 'Create an Account',
          labelColor: theme.colorScheme.onSecondary,
          buttonColor:
              isFormValid
                  ? theme.colorScheme.secondary
                  : theme.disabledColor.withAlpha(180),
          borderSide: BorderSide(
            color: isFormValid ? Colors.transparent : theme.disabledColor,
            width: 1,
          ),
          onPressed: () {
            if (formKey.currentState!.validate() && isFormValid) {
              SignUpViewModel signUp = SignUpViewModel.get(context);
              signUp.signUp(buyerName, email, phone, password, context);
            }
          },
        );
      },
    );
  }
}
