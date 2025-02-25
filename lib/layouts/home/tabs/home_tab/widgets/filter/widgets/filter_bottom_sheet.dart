import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/text_styles.dart';
import '../filter_cubit/filter_cubit.dart';
import '../filter_cubit/filter_state.dart';
import '../models/brands.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: MediaQuery.sizeOf(context).height * 0.6,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
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
                      Text("Filters",
                          style: TextStyles.filterBottomSheetTitles),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          context.read<FilterCubit>().clearFilters();
                        },
                        icon: const Icon(Icons.close),
                      )
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
                        _buildBrandFilter(context, state),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  _buildActionButtons(context),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildPriceFilter(BuildContext context, FilterState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Price",
                style:
                    TextStyles.filterBottomSheetTitles.copyWith(fontSize: 18)),
            const Spacer(),
            Text("\$ ",
                style: TextStyles.filterBottomSheetTitles
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w500)),
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
          activeColor: Theme.of(context).colorScheme.primary,
          inactiveColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          onChanged: (RangeValues values) {
            context.read<FilterCubit>().updateRange(values.start, values.end);
          },
        ),
      ],
    );
  }

  Widget _buildPriceInput(BuildContext context, String label, double value,
      Function(double) onValueChanged) {
    return GestureDetector(
      onTap: () => _showPriceInputDialog(context, label, value, onValueChanged),
      child: Text("${value.round()}",
          style: TextStyles.filterBottomSheetTitles
              .copyWith(fontSize: 14, fontWeight: FontWeight.w500)),
    );
  }

  void _showPriceInputDialog(BuildContext context, String label,
      double currentValue, Function(double) onValueChanged) {
    TextEditingController controller =
        TextEditingController(text: currentValue.round().toString());
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Enter $label Price",
          textAlign: TextAlign.center,
        ),
        titleTextStyle: TextStyles.filterBottomSheetTitles,
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(hintText: "Enter value"),
          style: TextStyles.filterBottomSheetTitles
              .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel",
                  style: TextStyles.filterBottomSheetTitles
                      .copyWith(fontSize: 18, fontWeight: FontWeight.w500))),
          TextButton(
            onPressed: () {
              double? value = double.tryParse(controller.text);
              if (value != null && value >= 0) {
                onValueChanged(value);
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Please enter a valid number.")));
              }
            },
            child: Text("Confirm",
                style: TextStyles.filterBottomSheetTitles.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary)),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingFilter(BuildContext context, FilterState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Rating",
            style: TextStyles.filterBottomSheetTitles.copyWith(fontSize: 18)),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.04),
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
    final ScrollController scrollController = ScrollController();
    final List<String> options = [
      "Newest",
      "Best Sellers",
      "Top Rated",
      "Price: Low to High",
      "Price: High to Low",
      "Top Viewed"
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
        Text("Sort by",
            style: TextStyles.filterBottomSheetTitles.copyWith(fontSize: 18)),
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
                  children: options
                      .map((option) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: ChoiceChip(
                              label: Text(option),
                              labelStyle: TextStyles.filterBottomSheetTitles
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                              side: const BorderSide(color: Colors.transparent),
                              selected: state.sortBy == option,
                              onSelected: (_) =>
                                  context.read<FilterCubit>().setSortBy(option),
                            ),
                          ))
                      .toList(),
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

  Widget _buildBrandFilter(BuildContext context, FilterState state) {
    final filteredBrands = Brand.dummyBrands
        .where((brand) => brand.subcategoryId == state.selectedSubcategory?.id)
        .toList();

    if (filteredBrands.length <= 2) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Brand",
              style: TextStyles.filterBottomSheetTitles.copyWith(fontSize: 18)),
          const SizedBox(height: 5),
          Row(
            children: filteredBrands
                .map((brand) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ChoiceChip(
                        padding: const EdgeInsets.all(8),
                        label: Text(brand.name),
                        labelStyle: TextStyles.filterBottomSheetTitles.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        side: const BorderSide(color: Colors.transparent),
                        avatar: SvgPicture.asset(brand.iconPath),
                        showCheckmark: false,
                        selected: state.selectedBrands.contains(brand.id),
                        onSelected: (_) =>
                            context.read<FilterCubit>().toggleBrand(brand.id),
                      ),
                    ))
                .toList(),
          ),
        ],
      );
    }

    final ScrollController scrollController = ScrollController();

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
        Text("Brand",
            style: TextStyles.filterBottomSheetTitles.copyWith(fontSize: 18)),
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
                  children: filteredBrands
                      .map((brand) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: ChoiceChip(
                              padding: const EdgeInsets.all(8),
                              label: Text(brand.name),
                              avatar: SvgPicture.asset(brand.iconPath),
                              showCheckmark: false,
                              selected: state.selectedBrands.contains(brand.id),
                              onSelected: (_) => context
                                  .read<FilterCubit>()
                                  .toggleBrand(brand.id),
                            ),
                          ))
                      .toList(),
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

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              context.read<FilterCubit>().clearSubFilters();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
            child: const Text("Reset", style: TextStyle(color: Colors.black)),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary),
            child: const Text("Apply", style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
