import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/resuebale_componants/product_list_builder.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/Products.dart';
import 'package:smart_ecommerce/di/di.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/best_seller/view_model/best_seller_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/best_seller/view_model/best_seller_view_model_states.dart';

class BestSellerWidgetBuider extends StatelessWidget {
  const BestSellerWidgetBuider({
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
              getIt<BestSellerViewModel>()..getBestSeller(token: token),
      child: BlocBuilder<BestSellerViewModel, BestSellerViewModelStates>(
        builder: (context, state) {
          if (state is BestSellerSuccessState) {
            List<Products> bestSellerModel = state.bestSellerModel;
            return ProductListBuilder(
              label: "Best Seller",
              index: bestSellerModel.length,
              products: bestSellerModel,
              token: token,
              userId: userId,
            );
          }
          if (state is BestSellerErrorState) {
            return Text(state.errorMessage);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
