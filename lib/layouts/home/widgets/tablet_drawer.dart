import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/core/resuebale_componants/app_snack_bar.dart';
import 'package:smart_ecommerce/di/di.dart';
import 'package:smart_ecommerce/layouts/home/provider/category_provider.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/categorys/view_model/home_categories_states.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/categorys/view_model/home_categories_view_model.dart';

import '../../../core/utils/assets.dart';
import '../provider/home_provider.dart';

class TabletDrawer extends StatelessWidget {
  const TabletDrawer({super.key, required this.token, required this.userId});
  final String token;
  final String userId;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var provider = Provider.of<CategoryProvider>(context,);
    return Drawer( 
      shape: const LinearBorder(),
      backgroundColor: theme.colorScheme.surface,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Options", style: theme.textTheme.titleLarge),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                children: [
                  selectedCategory(
                    imagePath: Assets.assetsIconsHomeIcon,
                    context: context,
                    title: "Home",
                    index: 0,
                  ),
                  const SizedBox(height: 20),
                  selectedCategory(
                    imagePath: Assets.assetsIconsCompareIcon,
                    context: context,
                    title: 'Compare',
                    index: 1,
                  ),
                  const SizedBox(height: 20),
                  selectedCategory(
                    imagePath: Assets.assetsIconsSavedIcon,
                    context: context,
                    title: "Saved",
                    index: 2,
                  ),
                  const SizedBox(height: 20),
                  selectedCategory(
                    imagePath: Assets.assetsIconsCartIcon,
                    context: context,
                    title: "Cart",
                    index: 3,
                  ),
                  const SizedBox(height: 20),
                  selectedCategory(
                    imagePath: Assets.assetsIconsAccountIcon,
                    context: context,
                    title: "Account",
                    index: 4,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Category", style: theme.textTheme.titleLarge),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => provider.setSelectedCategory(null),
                    child: selectedOption(
                      imagePath: Assets.assetsIconsAllCategory,
                      context: context,
                      title: "All",
                      index: 0,
                    ),
                  ),
                  BlocProvider(
                    create:
                        (_) =>
                            getIt<HomeCategoriesViewModel>()
                              ..getCategories(token),
                    child: BlocBuilder<
                      HomeCategoriesViewModel,
                      HomeCategoriesState
                    >(
                      builder: (context, state) {
                        if (state is HomeCategoriesErrorState) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            AppSnackBar.show(
                              context: context,
                              message: state.message,
                              icon: Icons.error,
                              backgroundColor: Colors.red,
                              fromTop: true,
                            );
                          });
                          return const SizedBox();
                        } else if (state is HomeCategoriesSuccessState) {
                          final categories = state.categories;

                          if (categories.isEmpty) {
                            return const Center(
                              child: Text("No categories found"),
                            );
                          }

                          return ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: categories.length,
                            separatorBuilder:
                                (_, __) => const SizedBox(height: 16),
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: () => provider.setSelectedCategory(categories[i]),
                                child: selectedOption(
                                  imagePath: Assets.assetsIconsAllCategory,
                                  context: context,
                                  title: categories[i].categoryName ?? '',
                                  index: i + 1,
                                ),
                              );
                            },
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectedCategory({
    required String imagePath,
    required BuildContext context,
    required String title,
    required int index,
  }) {
    final theme = Theme.of(context);
    var provider = Provider.of<HomeProvider>(context, listen: true);
    bool isSelected = (provider.homeTapIndex == index);
    return GestureDetector(
      onTap: () => provider.changeHomeTapIndex(newValue: index),
      child: Row(
        children: [
          SizedBox(
            height: isSelected ? 30 : 20,
            width: isSelected ? 30 : 20,
            child: SvgPicture.asset(
              imagePath,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.secondary,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: theme.textTheme.bodyLarge?.copyWith(
                color:
                    isSelected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.secondary,
                fontSize: isSelected ? 22 : 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget selectedOption({
    required String imagePath,
    required BuildContext context,
    required String title,
    required int index,
  }) {
    final theme = Theme.of(context);
    var provider = Provider.of<HomeProvider>(context, listen: true);
    bool isSelected = (provider.selectedCatedgoryIndex == index);
    return GestureDetector(
      onTap: () => provider.changeSelectedCatedgoryIndex(newValue: index),
      child: Row(
        children: [
          SizedBox(
            height: isSelected ? 30 : 20,
            width: isSelected ? 30 : 20,
            child: SvgPicture.asset(
              imagePath,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.secondary,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: theme.textTheme.bodyLarge?.copyWith(
                color:
                    isSelected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.secondary,
                fontSize: isSelected ? 22 : 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
