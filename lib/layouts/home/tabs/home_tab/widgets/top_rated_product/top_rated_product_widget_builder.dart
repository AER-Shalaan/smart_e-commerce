import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/resuebale_componants/product_list_builder.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/Products.dart';
import 'package:smart_ecommerce/di/di.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/top_rated_product/view_model/top_rated_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/top_rated_product/view_model/top_rated_view_model_states.dart';

class TopRatedProductWidgetBuilder extends StatelessWidget {
  const TopRatedProductWidgetBuilder({
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
          (context) => getIt<TopRatedViewModel>()..getTopRated(token: token),
      child: BlocBuilder<TopRatedViewModel, TopRatedViewModelStates>(
        builder: (context, state) {
          if (state is TopRatedSuccessState) {
            List<Products> topRatedModel = state.topRatedModel;
            return ProductListBuilder(
              label: "Top Rated",
              index: topRatedModel.length,
              products: topRatedModel,
              token: token,
              userId: userId,
            );
          }
          if (state is TopRatedErrorState) {
            return Text(state.errorMessage);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
