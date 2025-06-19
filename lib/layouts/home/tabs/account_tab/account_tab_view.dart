import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_ecommerce/config/auth_session.dart';
import 'package:smart_ecommerce/core/resuebale_componants/dialogs.dart';
import 'package:smart_ecommerce/core/resuebale_componants/wide_arrow_button.dart';
import 'package:smart_ecommerce/core/utils/assets.dart';
import 'package:smart_ecommerce/core/utils/routes.dart';


class AccountTabView extends StatelessWidget {
  const AccountTabView({super.key, required this.token, required this.userId});
 final String token;
  final String userId;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Divider(
          indent: 25,
          endIndent: 25,
          color: theme.dividerColor,
        ),
         WideArrowButton(
          label: 'My Orders',
          imagePath: Assets.assetsIconsBox,
          routeName: Routes.myOrdersViewRouteName,
          token: token,
          userId: userId,
        ),
        Container(
          color: theme.dividerColor.withAlpha(30),
          height: 8,
          width: double.infinity,
        ),
         WideArrowButton(
          label: 'My Details',
          imagePath: Assets.assetsIconsDetails,
          routeName: Routes.myDetailsViewRouteName,
          token: token,
          userId: userId,
        ),
        Divider(
          indent: 25,
          endIndent: 25,
          color: theme.dividerColor,
        ),
         WideArrowButton(
          label: 'Address Book',
          imagePath: Assets.assetsIconsAddress,
          routeName: Routes.addressBookViewRouteName,
          token: token,
          userId: userId,
        ),
        Divider(
          indent: 25,
          endIndent: 25,
          color: theme.dividerColor,
        ),
         WideArrowButton(
          label: 'Notifications',
          imagePath: Assets.assetsIconsBell,
          routeName: Routes.notificationsViewRouteName,
          token: token,
          userId: userId,
        ),
        Container(
          color: theme.dividerColor.withAlpha(30),
          height: 8,
          width: double.infinity,
        ),
         WideArrowButton(
          label: 'FAQs',
          imagePath: Assets.assetsIconsQuestion,
          routeName: Routes.fAQsViewRouteName,
          token: token,
          userId: userId,
        ),
        Divider(
          indent: 25,
          endIndent: 25,
          color: theme.dividerColor,
        ),   
        Container(
          color: theme.dividerColor.withAlpha(30),
          height: 8,
          width: double.infinity,
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(left: 25, bottom: 25),
          child: GestureDetector(
            onTap: () {
              CustomDialogs.showConfirmationDialog(
                context,
                title: 'Logout?',
                content: 'Are you sure you want to logout?',
                confirmationLabel: 'Yes, Logout',
                cancelLabel: 'No, Cancel',
                confirmationColor: theme.colorScheme.error,
                onConfirm: () {
                  AuthSession.clear();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.loginViewRouteName,
                    (route) => false,
                  );
                },
                icon: Icons.error_outline,
                iconColor: theme.colorScheme.error,
              );
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  Assets.assetsIconsLogout,
                  colorFilter: ColorFilter.mode(
                    theme.colorScheme.error,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  "Log out",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: theme.colorScheme.error,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
