import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layouts/home/tabs/home_tab/widgets/filter/filter_cubit/filter_cubit.dart';
import '../../layouts/home/tabs/home_tab/widgets/filter/filter_cubit/filter_state.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class ReusableFilterDialog<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final String Function(T) itemLabel;
  final IconData Function(T)? itemIcon;
  final void Function(T) onItemSelected;
  final void Function()? onNextPressed;
  final void Function()? onConfirmPressed;
  final void Function()? onCancelPressed;

  const ReusableFilterDialog({
    super.key,
    required this.title,
    required this.items,
    required this.itemLabel,
    required this.itemIcon,
    required this.onItemSelected,
    required this.onConfirmPressed,
    required this.onNextPressed,
    required this.onCancelPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backGroundColor,
      title: Column(
        children: [
          Text(title, style: TextStyles.filterBottomSheetTitles),
          TextField(
            decoration: const InputDecoration(hintText: 'Search...'),
            style: TextStyles.filterBottomSheetTitles.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.secondary,
            ),
            onChanged: (value) {
              context.read<FilterCubit>().updateSearchQuery(value);
            },
          ),
        ],
      ),
      content: BlocBuilder<FilterCubit, FilterState>(
        builder: (context, state) {
          if (state is FilterLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          List<T> filteredItems =
              items
                  .where(
                    (item) => itemLabel(
                      item,
                    ).toLowerCase().contains(state.searchQuery.toLowerCase()),
                  )
                  .toList();

          return SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                T item = filteredItems[index];
                bool isSelected = state.selectedItemForBorder == item;

                return GestureDetector(
                  onTap: () {
                    context.read<FilterCubit>().setSelectedItemForBorder(item);
                    onItemSelected(item);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color:
                            isSelected
                                ? AppColors.primary
                                : AppColors.secondary.withOpacity(0.4),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            if (itemIcon != null)
                              Icon(
                                itemIcon!(item),
                                size: MediaQuery.sizeOf(context).width * 0.06,
                                color:
                                    isSelected
                                        ? AppColors.primary
                                        : AppColors.secondary,
                              ),
                            const SizedBox(width: 15),
                            Text(
                              itemLabel(item),
                              style: TextStyles.filterBottomSheetTitles
                                  .copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                        isSelected
                            ? const Icon(Icons.check, color: AppColors.primary)
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: onCancelPressed,
          child: Text(
            'Cancel',
            style: TextStyles.filterBottomSheetTitles.copyWith(fontSize: 14),
          ),
        ),
        TextButton(
          onPressed: onConfirmPressed,
          child: Text(
            'Done',
            style: TextStyles.filterBottomSheetTitles.copyWith(
              fontSize: 14,
              color: Colors.cyan[800],
            ),
          ),
        ),
        TextButton(
          onPressed: onNextPressed,
          child: Text(
            'Next',
            style: TextStyles.filterBottomSheetTitles.copyWith(
              fontSize: 14,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
