import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/assets.dart';
import '../filter/filter_button.dart';

class HomeTabAppBar extends StatelessWidget {
  const HomeTabAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      elevation: 0,
      shadowColor: Colors.transparent,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.backGroundColor,
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
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      hintText: "search",
                      hintStyle: Theme.of(context).textTheme.titleMedium,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 8),
                        child: SvgPicture.asset(
                          Assets.assetsIconsSearchIcon,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.secondary,
                              BlendMode.srcIn),
                        ),
                      ),
                      prefixIconConstraints:
                          const BoxConstraints(minHeight: 30, minWidth: 30),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 8)),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const Expanded(flex: 2, child: FilterButton()),
            ],
          ),
        ),
      ),
    );
  }
}
