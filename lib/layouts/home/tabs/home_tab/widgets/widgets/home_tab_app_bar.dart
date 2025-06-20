import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_ecommerce/core/utils/assets.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/filter/filter_button.dart';

class HomeTabAppBar extends StatelessWidget {
  final String token;
  final String userId;
  const HomeTabAppBar({super.key, required this.token, required this.userId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      floating: true,
      snap: true,
      elevation: 0,
      shadowColor: Colors.transparent,
      scrolledUnderElevation: 0,
      backgroundColor: theme.scaffoldBackgroundColor,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                flex: 15,
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: theme.colorScheme.primary,
                        width: 1.5,
                      ),
                    ),
                    hintText: "search",
                    hintStyle: theme.textTheme.titleMedium,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 8),
                      child: SvgPicture.asset(
                        Assets.assetsIconsSearchIcon,
                        colorFilter: ColorFilter.mode(
                          theme.colorScheme.secondary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minHeight: 30,
                      minWidth: 30,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(flex: 2, child: FilterButton(token: token, userId: userId,)),
            ],
          ),
        ),
      ),
    );
  }
}
