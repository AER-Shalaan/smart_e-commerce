import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_ecommerce/core/resuebale_componants/reusable_filter_dialog.dart';
import 'package:smart_ecommerce/core/utils/assets.dart';
import 'package:smart_ecommerce/core/utils/routes.dart';
import 'package:smart_ecommerce/data/models/home_models/categories_model/category.dart';
import 'package:smart_ecommerce/data/models/home_models/categories_model/sub_category.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/filter/filter_cubit/filter_cubit.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/filter/model_view/categories_view_model/categories_states.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/filter/model_view/categories_view_model/categories_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/filter/model_view/filter_view_model/filter_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/filter/model_view/subcategories_from_category_view_model/subcategories_from_category_states.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/filter/model_view/subcategories_from_category_view_model/subcategories_from_category_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/filter/widgets/filter_bottom_sheet.dart';

class FilterButton extends StatelessWidget {
  final String token;
  final String userId;
  const FilterButton({super.key, required this.token, required this.userId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.secondary,
        overlayColor: theme.colorScheme.primary.withAlpha(40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(10),
        minimumSize: const Size(50, 50),
      ),
      onPressed: () {
        context.read<FilterCubit>().clearFilters();
        context.read<CategoriesViewModel>().getCategories(token);
        _showCategoryDialog(context);
      },
      child: SvgPicture.asset(Assets.assetsIconsFilterIcon),
    );
  }

  void _showCategoryDialog(BuildContext context) {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      builder: (context) {
        return BlocBuilder<CategoriesViewModel, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoadingState) {
              return const AlertDialog(
                content: SizedBox(
                  height: 100,
                  child: Center(child: CircularProgressIndicator()),
                ),
              );
            } else if (state is CategoriesSuccessState) {
              final categories = state.categories;

              return ReusableFilterDialog<Category>(
                title: 'Select Category',
                items: categories,
                itemLabel: (category) => category.categoryName ?? '',
                itemImage: (category) => category.categoryImage ?? '',
                onItemSelected: (category) {
                  context.read<FilterCubit>().setCategory(category);
                },
                onNextPressed: () {
                  final selectedCategory =
                      context.read<FilterCubit>().state.selectedCategory;
                  if (selectedCategory == null) {
                    _showSnackbar(context, 'Please select a category first.');
                  } else {
                    Navigator.pop(context);
                    context
                        .read<SubcategoriesFromCategoryViewModel>()
                        .getCategories(token, selectedCategory.categoryID!);
                    _showSubcategoryDialog(context, token: token);
                  }
                },
                onConfirmPressed: () {
                  final selectedCategory =
                      context.read<FilterCubit>().state.selectedCategory;
                  log(
                    "category id: ${selectedCategory?.categoryID.toString()}",
                  );
                  FilterViewModel.getObject(context).getFilteredData(
                    token: token,
                    categoryId: selectedCategory?.categoryID,
                    subCategoryId: null,
                    page: 1,
                    maxPrice: null,
                    minPrice: null,
                    rate: null,
                    mostViewed: null,
                    newwest: null,
                    mostSold: null,
                  );

                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    Routes.filterViewRouteName,
                    arguments: [token,userId],
                  );
                },
                onCancelPressed: () {
                  context.read<FilterCubit>().clearFilters();
                  Navigator.pop(context);
                },
              );
            } else if (state is CategoriesErrorState) {
              return AlertDialog(
                title: Text("Error", style: theme.textTheme.titleMedium),
                content: Text(state.message, style: theme.textTheme.bodyMedium),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Close",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const AlertDialog(
                content: SizedBox(
                  height: 100,
                  child: Center(child: CircularProgressIndicator()),
                ),
              );
            }
          },
        );
      },
    );
  }

  void _showSubcategoryDialog(BuildContext context, {required String token}) {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      builder: (context) {
        return BlocBuilder<
          SubcategoriesFromCategoryViewModel,
          SubcategoriesFromCategoryStates
        >(
          builder: (context, state) {
            if (state is SubcategoriesFromCategoryLoadingState) {
              return const AlertDialog(
                content: SizedBox(
                  height: 100,
                  child: Center(child: CircularProgressIndicator()),
                ),
              );
            } else if (state is SubcategoriesFromCategorySuccessState) {
              final subcategories = state.subCategories;

              return ReusableFilterDialog<SubCategory>(
                title:
                    context
                        .read<FilterCubit>()
                        .state
                        .selectedCategory
                        ?.categoryName ??
                    'Select Subcategory',
                items: subcategories,
                itemLabel: (subcategory) => subcategory.subCategoryName ?? '',
                itemImage: (subcategory) => subcategory.subCategoryImage ?? '',
                onItemSelected: (subcategory) {
                  context.read<FilterCubit>().setSubcategory(subcategory);
                },
                onNextPressed: () {
                  final selectedSubCategory =
                      context.read<FilterCubit>().state.selectedSubcategory;
                  if (selectedSubCategory == null) {
                    _showSnackbar(
                      context,
                      'Please select a subcategory first.',
                    );
                  } else {
                    Navigator.pop(context);
                    showModalBottomSheet(
                      context: context,
                      enableDrag: false,
                      builder:
                          (context) =>
                              FilterBottomSheet(token: token, userId: userId, ),
                    );
                  }
                },
                onConfirmPressed: () {
                  final selectedCategory =
                      context.read<FilterCubit>().state.selectedCategory;
                  final selectedSubCategory =
                      context.read<FilterCubit>().state.selectedSubcategory;
                  log(
                    "sub category id: ${selectedSubCategory?.categoryID.toString()}",
                  );
                  FilterViewModel.getObject(context).getFilteredData(
                    token: token,
                    categoryId: selectedCategory?.categoryID,
                    subCategoryId: selectedSubCategory?.subCategoryID,
                    page: 1,
                    maxPrice: null,
                    minPrice: null,
                    rate: null,
                    mostViewed: null,
                    newwest: null,
                    mostSold: null,
                  );
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    Routes.filterViewRouteName,
                    arguments: [token,userId],
                  );
                },
                onCancelPressed: () {
                  context.read<FilterCubit>().clearFilters();
                  Navigator.pop(context);
                },
              );
            } else if (state is SubcategoriesFromCategoryErrorState) {
              return AlertDialog(
                title: Text("Error", style: theme.textTheme.titleMedium),
                content: Text(state.message, style: theme.textTheme.bodyMedium),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Close",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const AlertDialog(
                content: SizedBox(
                  height: 100,
                  child: Center(child: CircularProgressIndicator()),
                ),
              );
            }
          },
        );
      },
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
        backgroundColor: theme.colorScheme.primary,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
