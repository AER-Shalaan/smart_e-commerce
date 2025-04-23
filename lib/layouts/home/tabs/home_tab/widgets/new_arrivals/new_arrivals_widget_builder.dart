import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/resuebale_componants/product_list_builder.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/Products.dart';
import 'package:smart_ecommerce/di/di.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/new_arrivals/view_model/new_arrivals_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/new_arrivals/view_model/new_arrivals_view_model_states.dart';

class NewArrivalsWidgetBuilder extends StatelessWidget {
  const NewArrivalsWidgetBuilder({
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
              getIt<NewArrivalsViewModel>()..getNewArrivals(token: token),
      child: BlocBuilder<NewArrivalsViewModel, NewArrivalsViewModelStates>(
        builder: (context, state) {
          if (state is NewArrivalsSuccessState) {
            List<Products> newArrivalsModel = state.newArrivalsModel;
            return ProductListBuilder(
              label: "New Arrivals",
              index: newArrivalsModel.length,
              products: newArrivalsModel,
              token: token,
              userId: userId,
            );
          }
          if (state is NewArrivalsErrorState) {
            return Text(state.errorMessage);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
