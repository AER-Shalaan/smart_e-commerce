import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/resuebale_componants/custom_auth_textfield.dart';
import '../../../../core/resuebale_componants/titleMediumText.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../Cubit/login_checks_cubit.dart';
import '../Cubit/login_checks_states.dart';

class LoginTextFields extends StatelessWidget {
  const LoginTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginChecksCubit, LoginChecksState>(
      builder: (context, state) {
        final loginChecksCubit = context.read<LoginChecksCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleMediumtext(text: "Email", opacity: 1),
            const SizedBox(height: 4),
            CustomAuthTextField(
              hint: "email@example",
              controller: loginChecksCubit.emailController,
              keyboard: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email_outlined),
              suffixIconConstraints: BoxConstraints.tight(const Size(50, 30)),
              focusNode: loginChecksCubit.emailFocusNode,
              suffixIcon:
                  state.isEmailCheck
                      ? SvgPicture.asset(Assets.assetsIconsCheck)
                      : state.isWrongEmail
                      ? SvgPicture.asset(Assets.assetsIconsWarningCircle)
                      : null,
              borderColor:
                  state.isEmailCheck
                      ? Colors.green
                      : state.isWrongEmail
                      ? Colors.red
                      : AppColors.primary.withOpacity(0.4),
            ),
            const SizedBox(height: 16),
            const TitleMediumtext(text: "Password", opacity: 1),
            const SizedBox(height: 4),
            CustomAuthTextField(
              hint: "Enter your password",
              controller: loginChecksCubit.passController,
              keyboard: TextInputType.visiblePassword,
              focusNode: loginChecksCubit.passFocusNode,
              obscure: state.isPasswordObscure,
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (state.isPassCheck)
                    SvgPicture.asset(Assets.assetsIconsCheck, height: 30),
                  if (state.isWrongPassword)
                    SvgPicture.asset(
                      Assets.assetsIconsWarningCircle,
                      height: 30,
                    ),
                  IconButton(
                    onPressed: loginChecksCubit.togglePasswordVisibility,
                    icon: SvgPicture.asset(
                      state.isPasswordObscure
                          ? Assets.assetsIconsEyeOff
                          : Assets.assetsIconsEye,
                    ),
                  ),
                ],
              ),
              borderColor:
                  state.isPassCheck
                      ? Colors.green
                      : state.isWrongPassword
                      ? Colors.red
                      : AppColors.primary.withOpacity(0.4),
            ),
          ],
        );
      },
    );
  }
}
