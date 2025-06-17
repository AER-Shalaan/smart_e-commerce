import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/constants.dart';
import '../../layouts/home/tabs/home_tab/widgets/filter/filter_cubit/filter_cubit.dart';
import '../../layouts/home/tabs/home_tab/widgets/filter/filter_cubit/filter_state.dart';

class ReusableFilterDialog<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final String Function(T) itemLabel;
  final String Function(T)? itemImage;
  final void Function(T) onItemSelected;
  final void Function()? onNextPressed;
  final void Function()? onConfirmPressed;
  final void Function()? onCancelPressed;

  const ReusableFilterDialog({
    super.key,
    required this.title,
    required this.items,
    required this.itemLabel,
    required this.itemImage,
    required this.onItemSelected,
    required this.onConfirmPressed,
    required this.onNextPressed,
    required this.onCancelPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AlertDialog(
      backgroundColor: theme.dialogBackgroundColor,
      title: Column(
        children: [
          Text(title, style: theme.textTheme.titleMedium),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: theme.textTheme.bodyMedium?.copyWith(
                color: theme.hintColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
            ),
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: colorScheme.secondary,
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
            height: MediaQuery.of(context).size.height * 0.39,
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
                                ? colorScheme.primary
                                : colorScheme.secondary.withAlpha(102),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            if (itemImage != null)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  Constants.baseUrl + itemImage!(item),
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (context, child, progress) {
                                    if (progress == null) return child;
                                    return SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          value:
                                              progress.expectedTotalBytes !=
                                                      null
                                                  ? progress
                                                          .cumulativeBytesLoaded /
                                                      progress
                                                          .expectedTotalBytes!
                                                  : null,
                                        ),
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: 40,
                                      height: 40,
                                      color: theme.dividerColor,
                                      child: Icon(
                                        Icons.broken_image,
                                        size: 24,
                                        color: theme.disabledColor,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            const SizedBox(width: 15),
                            Text(
                              itemLabel(item),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        isSelected
                            ? Icon(Icons.check, color: colorScheme.primary)
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
            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
          ),
        ),
        TextButton(
          onPressed: onConfirmPressed,
          child: Text(
            'Done',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              color: colorScheme.secondary,
            ),
          ),
        ),
        TextButton(
          onPressed: onNextPressed,
          child: Text(
            'Next',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              color: colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
