import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/config/auth_session.dart';
import 'package:smart_ecommerce/core/resuebale_componants/dialogs.dart';
import 'package:smart_ecommerce/core/utils/routes.dart';
import 'package:smart_ecommerce/data/models/auth_model/signup_model/sign_up_model.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/cubit/sign_up_check_cubit.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/cubit/sign_up_check_states.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/view_model/sign_up_view_model.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/view_model/sign_up_view_model_state.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/widgets/login_prompt.dart';
import 'package:smart_ecommerce/layouts/authentication/signup/widgets/signup_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocListener<SignUpViewModel, SignUpState>(
      listenWhen:
          (previous, current) =>
              current is SignUpSuccessState ||
              current is SignUpErrorState ||
              current is SignUpLoadingState,
      listener: (context, state) async {
        CustomDialogs.closeDialogs(context);

        if (state is SignUpSuccessState) {
          final SignUpModel signUpModel = state.signUpModel;
          final signUpChecksCubit = context.read<SignUpCheckCubit>();
          final navigator = Navigator.of(context);
          await AuthSession.saveSession(signUpModel.token.toString());

          signUpChecksCubit.resetSignUpData();

          Future.delayed(
            const Duration(seconds: 1),
            () => navigator.pushNamedAndRemoveUntil(
              Routes.homeView,
              (route) => false,
            ),
          );
        } else if (state is SignUpErrorState) {
          CustomDialogs.showErrorDialog(context, state.errorMessage);
        } else if (state is SignUpLoadingState) {
          CustomDialogs.showLoadingDialog(context);
        }
      },
      child: BlocBuilder<SignUpCheckCubit, SignUpCheckState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        SignUpForm(formKey: formKey),
                      ]),
                    ),
                  ),
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 24),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: LoginPrompt(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
