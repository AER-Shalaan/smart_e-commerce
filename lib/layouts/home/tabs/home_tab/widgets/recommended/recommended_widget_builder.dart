import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/resuebale_componants/static_product_list_builder.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/recommended/view_model/recommended_cubit.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/recommended/view_model/recommended_state.dart';

class RecommendedWidgetBuilder extends StatelessWidget {
  const RecommendedWidgetBuilder({
    super.key,
    required this.token,
    required this.userId,
  });

  final String token;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedProductsCubit, RecommendedState>(
      builder: (context, state) {
        if (state is RecommendedLoaded) {
          return StaticProductListBuilder(
            label: "Recommended for you",
            token: token,
            userId: userId,
            products: state.products.products ?? [],
          );
        }
        if (state is RecommendedError) {
          return Center(child: Text(state.message.message));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
