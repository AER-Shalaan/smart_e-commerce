import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/layouts/authentication/login/Cubit/login_checks_cubit.dart';
import 'package:smart_ecommerce/layouts/authentication/login/Cubit/login_checks_states.dart';
import '../../../../core/resuebale_componants/custom_main_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../view_model/login_view_model.dart';

class LogInButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const LogInButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginChecksCubit, LoginChecksState>(
      builder: (context, state) {
        bool isFormValid = state.isEmailCheck && state.isPassCheck;
        return CustomMainButton(
          label: 'Login',
          labelColor: Colors.white,
          buttonColor: isFormValid ? AppColors.secondary : Colors.grey,
          borderSide: BorderSide(
            color: isFormValid ? Colors.transparent : Colors.grey,
            width: 1,
          ),
          isDisabled: !isFormValid,
          onPressed: () {
            if (!isFormValid) return;
            if (formKey.currentState == null ||
                !formKey.currentState!.validate())
              return;

            final loginCubit = context.read<LoginChecksCubit>();
            final loginViewModel = LoginViewModel.get(context);

            String email = loginCubit.emailController.text;
            String password = loginCubit.passController.text;

            log(email);
            log(password);

            loginViewModel.login(email, password, context);
          },
        );
      },
    );
  }
}
