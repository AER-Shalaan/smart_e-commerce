import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/resuebale_componants/item_widget/item_widget.dart';
import 'package:smart_ecommerce/data/models/product_details_model/product_details_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/filter/model_view/filter_view_model/filter_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/filter/model_view/filter_view_model/filter_view_model_state.dart';

class CategoryScreenTablet extends StatelessWidget {
  const CategoryScreenTablet({
    super.key,
    required this.token,
    required this.userId,
  });
  final String token;
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FilterViewModel, FilterViewModelState>(
        builder: (context, state) {
          if (state is FilterViewModelSuccess) {
            final List<ProductDetailsModel> result =
                state.productsModel.products ?? [];

            if (result.isEmpty) {
              return Center(
                child: Text(
                  "No products found in this category",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: result.length,

                itemBuilder: (context, index) {
                  return ItemWidget(
                    product: result[index],
                    token: token,
                    userId: userId,
                  );
                },

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2,
                  mainAxisExtent: MediaQuery.sizeOf(context).height * 0.30,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 25,
                ),
              ),
            );
          } else if (state is FilterViewModelError) {
            return Center(
              child: Text(
                "Error loading products",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }

          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
