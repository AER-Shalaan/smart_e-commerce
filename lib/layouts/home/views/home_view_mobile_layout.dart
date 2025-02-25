import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/core/resuebale_componants/headlineText.dart';
import 'package:smart_ecommerce/core/utils/app_colors.dart';
import 'package:smart_ecommerce/core/utils/assets.dart';
import 'package:smart_ecommerce/layouts/home/provider/home_provider.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/account_tab_view.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/cart_tab.dart' show CartTab;
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/provider/cart_provider.dart';
import 'package:smart_ecommerce/layouts/home/tabs/comparison_tab/comparison_tab.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/home_tab.dart';
import 'package:smart_ecommerce/layouts/home/tabs/saved_tab/saved_tab.dart';

class HomeViewMobileLayout extends StatelessWidget {
  const HomeViewMobileLayout({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Provider.of<HomeProvider>(context);
    log(provider.homeTapIndex.toString());
    final List<Widget> navWidget = [
       HomeTab(token: token,),
      const ComparisonTab(),
      const SavedTab(),
      ChangeNotifierProvider(
          create: (_) => CartProvider(), child: const CartTab()),
      const AccountTabView()
    ];
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.backGroundColor,
        title: const Align(
            alignment: Alignment.centerLeft,
            child: Headlinetext(text: "Inspire")),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(
                Assets.assetsIconsNotifcations,
                height: 25,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width <= 600
          ? BottomNavigationBar(
              backgroundColor: Colors.white70,
              currentIndex: provider.homeTapIndex,
              onTap: (value) {
                provider.changeHomeTapIndex(newValue: value);
              },
              items: [
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon: SvgPicture.asset(
                      Assets.assetsIconsHomeIcon,
                      colorFilter: ColorFilter.mode(
                          provider.homeTapIndex == 0
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.3),
                          BlendMode.srcIn),
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon: SvgPicture.asset(
                      Assets.assetsIconsCompareIcon,
                      width: MediaQuery.of(context).size.width * 0.06,
                      colorFilter: ColorFilter.mode(
                          provider.homeTapIndex == 1
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.3),
                          BlendMode.srcIn),
                    ),
                    label: 'Compare'),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon: SvgPicture.asset(
                      Assets.assetsIconsSavedIcon,
                      colorFilter: ColorFilter.mode(
                          provider.homeTapIndex == 2
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.3),
                          BlendMode.srcIn),
                    ),
                    label: 'Saved'),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon: SvgPicture.asset(
                      Assets.assetsIconsCartIcon,
                      colorFilter: ColorFilter.mode(
                          provider.homeTapIndex == 3
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.3),
                          BlendMode.srcIn),
                    ),
                    label: 'Cart'),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon: SvgPicture.asset(
                      Assets.assetsIconsAccountIcon,
                      colorFilter: ColorFilter.mode(
                          provider.homeTapIndex == 4
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.3),
                          BlendMode.srcIn),
                    ),
                    label: 'Account'),
              ],
            )
          : null,
      body: navWidget[provider.homeTapIndex],
    );
  }
}
