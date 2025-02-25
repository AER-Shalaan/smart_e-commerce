import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/config/shared_preferences.dart';
import 'package:smart_ecommerce/layouts/authentication/login/Cubit/login_checks_cubit.dart';
import 'package:smart_ecommerce/layouts/authentication/login/Cubit/login_checks_states.dart';
import 'package:smart_ecommerce/layouts/authentication/login/view_model/login_view_model.dart';
import 'package:smart_ecommerce/layouts/authentication/login/view_model/login_view_model_state.dart';
import 'package:smart_ecommerce/layouts/authentication/login/widgets/login_form.dart';
import 'package:smart_ecommerce/layouts/authentication/login/widgets/sign_up_prompt.dart';
import '../../../core/resuebale_componants/dialogs.dart';
import '../../../core/utils/routes.dart';
import '../../../data/models/login_model/LoginModel.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocListener<LoginViewModel, LoginState>(
      listenWhen:
          (previous, current) =>
              current is LoginSuccessState ||
              current is LoginErrorState ||
              current is LoginLoadingState,
      listener: (context, state) async {
        CustomDialogs.closeDialogs(context);
        if (state is LoginSuccessState) {
          LoginModel loginModel = state.loginModel;
          SharedPreferencesFunctions.saveToken(loginModel.token.toString());

          Future.delayed(
            const Duration(seconds: 1),
            () => Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.homeView,
              (route) => false,
              arguments: loginModel.token,
            ),
          );
        } else if (state is LoginErrorState) {
          CustomDialogs.showErrorDialog(context, state.errorMessage);
        } else if (state is LoginLoadingState) {
          CustomDialogs.showLoadingDialog(context);
        }
      },
      child: BlocBuilder<LoginChecksCubit, LoginChecksState>(
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
                        LoginForm(formKey: formKey),
                      ]),
                    ),
                  ),
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 24),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SignUpPrompt(),
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
