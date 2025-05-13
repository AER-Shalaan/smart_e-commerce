import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/resuebale_componants/product_list_builder.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/Products.dart';
import 'package:smart_ecommerce/di/di.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/featured_product/view_model/featured_product_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/featured_product/view_model/featured_product_view_model_states.dart';

class FeaturedProductWidgetBuilder extends StatelessWidget {
  const FeaturedProductWidgetBuilder({
    super.key,
    required this.token,
    required this.userId,
  });
  final String token;
  final String userId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<FeaturedProductViewModel>()
                ..getFeaturedProducts(token: token),
      child:
          BlocBuilder<FeaturedProductViewModel, FeaturedProductViewModelStates>(
            builder: (context, state) {
              if (state is FeaturedProductSuccessState) {
                List<Products> featuredProductModel =
                    state.featuredProductModel;
                return ProductListBuilder(
                  label: "Featured Product",
                  index: featuredProductModel.length,
                  products: featuredProductModel,
                  token: token,
                  userId: userId,
                );
              }
              if (state is FeaturedProductErrorState) {
                return Text(state.errorMessage);
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
    );
  }
}
