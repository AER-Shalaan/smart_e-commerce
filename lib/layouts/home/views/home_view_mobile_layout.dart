import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/core/utils/assets.dart';
import 'package:smart_ecommerce/core/utils/routes.dart';
import 'package:smart_ecommerce/di/di.dart';
import 'package:smart_ecommerce/layouts/home/provider/comparison_category_provider.dart';
import 'package:smart_ecommerce/layouts/home/provider/home_provider.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/account_tab_view.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/cart_tab.dart';
import 'package:smart_ecommerce/layouts/home/tabs/comparison_tab/comparison_tab.dart';
import 'package:smart_ecommerce/layouts/home/tabs/comparison_tab/view_model/comparison_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/home_tab.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/search_feature/widgets/custom_search_icon_button.dart';
import 'package:smart_ecommerce/layouts/home/tabs/saved_tab/provider/wishlist_provider.dart';
import 'package:smart_ecommerce/layouts/home/tabs/saved_tab/saved_tab.dart';

class HomeViewMobileLayout extends StatelessWidget {
  const HomeViewMobileLayout({
    super.key,
    required this.token,
    required this.userId,
  });
  final String token;
  final String userId;

  void _showComparisonOverlay(BuildContext context) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (ctx) {
        final theme = Theme.of(context);
        final List<Map<String, dynamic>> categories = [
          {'name': 'Laptops', 'key': 'laptops', 'icon': Icons.laptop},
          {'name': 'Phones', 'key': 'phones', 'icon': Icons.smartphone},
          {'name': 'TVs', 'key': 'tVs', 'icon': Icons.tv},
          {'name': 'PCs', 'key': 'pCs', 'icon': Icons.computer},
          {'name': 'Smart Watches', 'key': 'smartWatches', 'icon': Icons.watch},
        ];
        return Stack(
          children: [
            // يغلق الـ Overlay لما تدوس برا النافذة
            Positioned.fill(
              child: GestureDetector(
                onTap: () => entry.remove(),
                child: Container(color: Colors.black.withOpacity(0.25)),
              ),
            ),
            Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 320,
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 18,
                  ),
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: theme.shadowColor.withOpacity(0.13),
                        blurRadius: 12,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Select Comparison Category",
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...categories.map(
                        (cat) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            onTap: () {
                              Provider.of<ComparisonCategoryProvider>(
                                context,
                                listen: false,
                              ).setCategory(cat['key']);
                              entry.remove();
                            },
                            leading: CircleAvatar(
                              backgroundColor: theme.primaryColor.withAlpha(24),
                              child: Icon(
                                cat['icon'],
                                color: theme.primaryColor,
                              ),
                            ),
                            title: Text(
                              cat['name'],
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    overlay.insert(entry);
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Provider.of<HomeProvider>(context);
    log(userId);
    log(provider.homeTapIndex.toString());
    final List<Widget> navWidget = [
      HomeTab(token: token, userId: userId),
      BlocProvider(
        create: (_) => getIt<ComparisonViewModel>(),

        child: ComparisonTab(token: token, userId: userId),
      ),

      ChangeNotifierProvider(
        create: (context) => WishlistProvider(),
        child: SavedTab(token: token, userId: userId),
      ),
      CartTab(token: token, userId: userId),
      AccountTabView(token: token, userId: userId),
    ];
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Inspire",
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          SearchButtonWidget(token: token, userId: userId),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(
                Assets.assetsIconsNotifcations,
                height: 25,
                colorFilter: ColorFilter.mode(
                  theme.colorScheme.secondary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton:
          provider.homeTapIndex == 0 || provider.homeTapIndex == 4
              ? FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.chatBotViewRouteName,
                    arguments: {'token': token, 'userId': userId},
                  );
                },
                shape: const CircleBorder(),
                backgroundColor: theme.colorScheme.primary,
                child: Icon(Icons.chat, color: theme.scaffoldBackgroundColor),
              )
              : provider.homeTapIndex == 1
              ? FloatingActionButton(
                onPressed: () {
                  _showComparisonOverlay(context);
                },
                backgroundColor: theme.colorScheme.primary,
                shape: const CircleBorder(),
                child: Icon(
                  Icons.backup_table_rounded,
                  color: theme.scaffoldBackgroundColor,
                ),
              )
              : null,
      bottomNavigationBar:
          MediaQuery.of(context).size.width <= 600
              ? BottomNavigationBar(
                backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
                currentIndex: provider.homeTapIndex,
                onTap: (value) {
                  provider.changeHomeTapIndex(newValue: value);
                },
                items: [
                  BottomNavigationBarItem(
                    backgroundColor: theme.colorScheme.primary,
                    icon: SvgPicture.asset(
                      Assets.assetsIconsHomeIcon,
                      colorFilter: ColorFilter.mode(
                        provider.homeTapIndex == 0
                            ? theme.colorScheme.primary
                            : theme.colorScheme.secondary.withAlpha(77),
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: theme.colorScheme.primary,
                    icon: SvgPicture.asset(
                      Assets.assetsIconsCompareIcon,
                      width: MediaQuery.of(context).size.width * 0.06,
                      colorFilter: ColorFilter.mode(
                        provider.homeTapIndex == 1
                            ? theme.colorScheme.primary
                            : theme.colorScheme.secondary.withAlpha(77),
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Compare',
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: theme.colorScheme.primary,
                    icon: SvgPicture.asset(
                      Assets.assetsIconsSavedIcon,
                      colorFilter: ColorFilter.mode(
                        provider.homeTapIndex == 2
                            ? theme.colorScheme.primary
                            : theme.colorScheme.secondary.withAlpha(77),
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Saved',
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: theme.colorScheme.primary,
                    icon: SvgPicture.asset(
                      Assets.assetsIconsCartIcon,
                      colorFilter: ColorFilter.mode(
                        provider.homeTapIndex == 3
                            ? theme.colorScheme.primary
                            : theme.colorScheme.secondary.withAlpha(77),
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Cart',
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: theme.colorScheme.primary,
                    icon: SvgPicture.asset(
                      Assets.assetsIconsAccountIcon,
                      colorFilter: ColorFilter.mode(
                        provider.homeTapIndex == 4
                            ? theme.colorScheme.primary
                            : theme.colorScheme.secondary.withAlpha(77),
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Account',
                  ),
                ],
              )
              : null,
      body: navWidget[provider.homeTapIndex],
    );
  }
}
