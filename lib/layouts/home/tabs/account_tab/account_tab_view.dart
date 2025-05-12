import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_ecommerce/config/shared_preferences.dart';
import 'package:smart_ecommerce/layouts/authentication/login/Cubit/login_checks_cubit.dart';
import '../../../../core/resuebale_componants/dialogs.dart';
import '../../../../core/resuebale_componants/wide_arrow_button.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/routes.dart';

class AccountTabView extends StatelessWidget {
  const AccountTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const Divider(indent: 25, endIndent: 25, color: Colors.black26),
        const WideArrowButton(
          label: 'My Orders',
          imagePath: Assets.assetsIconsBox,
          routeName: Routes.myOrdersViewRouteName,
        ),
        Container(color: Colors.black12, height: 8, width: double.infinity),
        const WideArrowButton(
          label: 'My Details',
          imagePath: Assets.assetsIconsDetails,
          routeName: Routes.myDetailsViewRouteName,
        ),
        const Divider(indent: 25, endIndent: 25, color: Colors.black26),
        const WideArrowButton(
          label: 'Address Book',
          imagePath: Assets.assetsIconsAddress,
          routeName: Routes.addressBookViewRouteName,
        ),
        const Divider(indent: 25, endIndent: 25, color: Colors.black26),
        const WideArrowButton(
          label: 'Notifications',
          imagePath: Assets.assetsIconsBell,
          routeName: Routes.notificationsViewRouteName,
        ),
        Container(color: Colors.black12, height: 8, width: double.infinity),
        const WideArrowButton(
          label: 'FAQs',
          imagePath: Assets.assetsIconsQuestion,
          routeName: Routes.fAQsViewRouteName,
        ),
        const Divider(indent: 25, endIndent: 25, color: Colors.black26),
        const WideArrowButton(
          label: 'Help Center',
          imagePath: Assets.assetsIconsHeadphones,
          routeName: Routes.helpCenterViewRouteName,
        ),
        Container(color: Colors.black12, height: 8, width: double.infinity),
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
                confirmationColor: Colors.red,
                onConfirm: () {
                  SharedPreferencesFunctions.clearToken();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.loginViewRouteName,
                    (route) {
                      return false;
                    },
                  );
                },
                icon: Icons.error_outline,
                iconColor: Colors.red,
              );
            },
            child: Row(
              children: [
                SvgPicture.asset(Assets.assetsIconsLogout),
                const SizedBox(width: 16),
                const Text(
                  "Log out",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.red,
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
