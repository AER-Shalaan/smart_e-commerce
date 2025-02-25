import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/cubit/sign_up_checks_cubit.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/cubit/sign_up_checks_states.dart';
import '../../../../core/resuebale_componants/custom_main_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../view_model/sign_up_view_model.dart';

class SignUpButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String buyerName;
  final String email;
  final String password;
  final String phone;
  final String location;
  const SignUpButton({
    super.key,
    required this.formKey,
    required this.buyerName,
    required this.email,
    required this.password,
    required this.location,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpChecksCubit, SignUpChecksState>(
      builder: (context, state) {
        return CustomMainButton(
          label: 'Create an Account',
          labelColor: Colors.white,
          buttonColor:
              state.isFNCheck &&
                      state.isLNCheck &&
                      state.isEmailCheck &&
                      state.isPassCheck &&
                      state.isConfirmPassCheck
                  ? AppColors.secondary
                  : Colors.grey,
          borderSide: BorderSide(
            color:
                state.isFNCheck &&
                        state.isLNCheck &&
                        state.isEmailCheck &&
                        state.isPassCheck &&
                        state.isConfirmPassCheck
                    ? Colors.transparent
                    : Colors.grey,
            width: 1,
          ),
          onPressed: () {
            if (formKey.currentState!.validate() &&
                state.isFNCheck &&
                state.isLNCheck &&
                state.isEmailCheck &&
                state.isPassCheck &&
                state.isConfirmPassCheck) {
              SignUpViewModel signUp = SignUpViewModel.get(context);
              signUp.signUp(
                buyerName,
                email,
                phone,
                password,
                location,
                context,
              );
            }
          },
        );
      },
    );
  }
}
