import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resuebale_componants/custom_main_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                color: AppColors.secondary.withOpacity(0.4),
                endIndent: 10,
              ),
            ),
            Text(
              'Or',
              style: GoogleFonts.dmSans(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.secondary.withOpacity(0.65),
              ),
            ),
            Expanded(
              child: Divider(
                color: AppColors.secondary.withOpacity(0.4),
                thickness: 1,
                indent: 10,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        CustomMainButton(
          label: "Login with Google",
          labelColor: Colors.black,
          buttonColor: Colors.white,
          icon: SvgPicture.asset(Assets.assetsIconsLogosGoogleIcon),
          borderSide: BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: AppColors.secondary.withOpacity(0.4),
          ),
        ),
        const SizedBox(height: 16),
        CustomMainButton(
          label: "Login with Facebook",
          labelColor: Colors.white,
          buttonColor: const Color(0xff1877F2),
          icon: SvgPicture.asset(Assets.assetsIconsLogosFacebook),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
