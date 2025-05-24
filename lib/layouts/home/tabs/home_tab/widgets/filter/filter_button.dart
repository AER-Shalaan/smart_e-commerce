import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_ecommerce/core/resuebale_componants/reusable_filter_dialog.dart';
import 'package:smart_ecommerce/core/utils/assets.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/filter/filter_cubit/filter_cubit.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/filter/models/category_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/filter/models/subcategory_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/filter/widgets/filter_bottom_sheet.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        overlayColor: Colors.white.withAlpha(102),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(10),
        minimumSize: const Size(50, 50),
      ),
      onPressed: () {
        BlocProvider.of<FilterCubit>(context).clearFilters();
        _showCategoryDialog(context);
      },
      child: SvgPicture.asset(Assets.assetsIconsFilterIcon),
    );
  }

  void _showCategoryDialog(BuildContext context) {
    final categories = Category.dummyCategories;
    showDialog(
      context: context,
      builder:
          (context) => ReusableFilterDialog<Category>(
            title: 'Select Category',
            items: categories,
            itemLabel: (category) => category.name,
            itemIcon: (category) => category.icon,
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
                _showSubcategoryDialog(context, selectedCategory.id);
              }
            },
            onConfirmPressed: () {
              Navigator.pop(context);
              // تنفيذ API لاسترجاع المنتجات الخاصة بهذه الفئة
            },
            onCancelPressed: () {
              context.read<FilterCubit>().clearFilters();
              Navigator.pop(context);
            },
          ),
    );
  }

  void _showSubcategoryDialog(BuildContext context, int categoryId) {
    final subcategories =
        Subcategory.dummySubcategories
            .where((sub) => sub.categoryId == categoryId)
            .toList();

    showDialog(
      context: context,
      builder:
          (context) => ReusableFilterDialog<Subcategory>(
            title:
                context.read<FilterCubit>().state.selectedCategory?.name ??
                'Select Subcategory',
            items: subcategories,
            itemLabel: (subcategory) => subcategory.name,
            itemIcon: (subcategory) => subcategory.icon,
            onItemSelected: (subcategory) {
              context.read<FilterCubit>().setSubcategory(subcategory);
            },
            onNextPressed: () {
              final selectedSubCategory =
                  context.read<FilterCubit>().state.selectedSubcategory;
              if (selectedSubCategory == null) {
                _showSnackbar(context, 'Please select a subcategory first.');
              } else {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: context,
                  enableDrag: false,
                  builder: (context) => const FilterBottomSheet(),
                );
              }
            },
            onConfirmPressed: () {
              Navigator.pop(context);
            },
            onCancelPressed: () {
              context.read<FilterCubit>().clearFilters();
              Navigator.pop(context);
            },
          ),
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }
}
