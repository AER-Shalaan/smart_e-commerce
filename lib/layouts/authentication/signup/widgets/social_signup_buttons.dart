import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/resuebale_componants/custom_main_button.dart';
import '../../../../core/utils/assets.dart';

class SocialSignUpButtons extends StatelessWidget {
  const SocialSignUpButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                color: theme.colorScheme.secondary.withAlpha(102),
                endIndent: 10,
              ),
            ),
            Text(
              'Or',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.secondary.withAlpha(166),
              ),
            ),
            Expanded(
              child: Divider(
                color: theme.colorScheme.secondary.withAlpha(102),
                thickness: 1,
                indent: 10,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        CustomMainButton(
          label: "SignUp with Google",
          labelColor: Colors.black,
          buttonColor: theme.colorScheme.onPrimary,
          icon: SvgPicture.asset(Assets.assetsIconsLogosGoogleIcon),
          borderSide: BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: theme.colorScheme.secondary.withAlpha(102),
          ),
        ),
        const SizedBox(height: 16),
        CustomMainButton(
          label: "SignUp with Facebook",
          labelColor: Colors.white,
          buttonColor: const Color(0xff1877F2),
          icon: SvgPicture.asset(Assets.assetsIconsLogosFacebook),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
