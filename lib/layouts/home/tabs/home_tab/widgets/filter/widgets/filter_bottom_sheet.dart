import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/filter/filter_cubit/filter_cubit.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/filter/filter_cubit/filter_state.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: MediaQuery.sizeOf(context).height * 0.6,
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: BlocBuilder<FilterCubit, FilterState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Filters", style: theme.textTheme.titleLarge),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          context.read<FilterCubit>().clearFilters();
                        },
                        icon: Icon(Icons.close, color: theme.iconTheme.color),
                      ),
                    ],
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildSortByFilter(context, state),
                        const Divider(),
                        _buildPriceFilter(context, state),
                        const Divider(),
                        _buildRatingFilter(context, state),
                        const Divider(),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  _buildActionButtons(context, theme),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildPriceFilter(BuildContext context, FilterState state) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Price",
              style: theme.textTheme.titleMedium?.copyWith(fontSize: 18),
            ),
            const Spacer(),
            Text(
              "\$ ",
              style: theme.textTheme.titleMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            _buildPriceInput(context, "Min", state.start, (value) {
              context.read<FilterCubit>().updateRange(value, state.end);
            }),
            const Text(" - "),
            _buildPriceInput(context, "Max", state.end, (value) {
              context.read<FilterCubit>().updateRange(state.start, value);
            }),
          ],
        ),
        RangeSlider(
          values: RangeValues(state.start, state.end),
          min: 0,
          max: 100000,
          divisions: 1000,
          activeColor: theme.colorScheme.primary,
          inactiveColor: theme.colorScheme.primary.withAlpha(102),
          onChanged: (RangeValues values) {
            context.read<FilterCubit>().updateRange(values.start, values.end);
          },
        ),
      ],
    );
  }

  Widget _buildPriceInput(
    BuildContext context,
    String label,
    double value,
    Function(double) onValueChanged,
  ) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => _showPriceInputDialog(context, label, value, onValueChanged),
      child: Text(
        "${value.round()}",
        style: theme.textTheme.bodyLarge?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  void _showPriceInputDialog(
    BuildContext context,
    String label,
    double currentValue,
    Function(double) onValueChanged,
  ) {
    final theme = Theme.of(context);
    TextEditingController controller = TextEditingController(
      text: currentValue.round().toString(),
    );
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              "Enter $label Price",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium,
            ),
            content: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(hintText: "Enter value"),
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Cancel",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  double? value = double.tryParse(controller.text);
                  if (value != null && value >= 0) {
                    onValueChanged(value);
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Please enter a valid number.",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                        backgroundColor: theme.colorScheme.primary,
                      ),
                    );
                  }
                },
                child: Text(
                  "Confirm",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
    );
  }

  Widget _buildRatingFilter(BuildContext context, FilterState state) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rating",
          style: theme.textTheme.titleMedium?.copyWith(fontSize: 18),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.04,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < state.selectedRating
                        ? Icons.star_rounded
                        : Icons.star_border_rounded,
                    size: MediaQuery.sizeOf(context).width * 0.085,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    context.read<FilterCubit>().setRating(index + 1);
                  },
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSortByFilter(BuildContext context, FilterState state) {
    final theme = Theme.of(context);
    final ScrollController scrollController = ScrollController();
    final List<String> options = [
      "Newest",
      "Best Sellers",
      "Top Rated",
      "Price: Low to High",
      "Price: High to Low",
      "Top Viewed",
    ];

    void scrollLeft() {
      scrollController.animateTo(
        scrollController.offset - 100,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    void scrollRight() {
      scrollController.animateTo(
        scrollController.offset + 100,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sort by",
          style: theme.textTheme.titleMedium?.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: scrollLeft,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: scrollController,
                child: Row(
                  children:
                      options.map((option) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: ChoiceChip(
                            label: Text(
                              option,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            side: const BorderSide(color: Colors.transparent),
                            selected: state.sortBy == option,
                            onSelected:
                                (_) => context.read<FilterCubit>().setSortBy(
                                  option,
                                ),
                            selectedColor: theme.colorScheme.primary.withAlpha(
                              50,
                            ),
                            backgroundColor: theme.disabledColor.withAlpha(15),
                          ),
                        );
                      }).toList(),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: scrollRight,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, ThemeData theme) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              context.read<FilterCubit>().clearSubFilters();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.disabledColor.withAlpha(30),
            ),
            child: Text(
              "Reset",
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
            ),
            child: Text(
              "Apply",
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
