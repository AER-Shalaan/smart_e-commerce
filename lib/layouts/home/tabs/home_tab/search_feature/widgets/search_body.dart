import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/resuebale_componants/item_widget/item_widget.dart';
import 'package:smart_ecommerce/data/models/product_details_model/product_details_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/search_feature/view_model/search_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/search_feature/view_model/search_view_model_state.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({
    super.key, required this.token, required this.userId,
  });
  final String token;
  final String userId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchTabViewModel, SearchTabStates>(
      builder: (context, state) {
        if (state is SearchTabSuccessState) {
          
          List<ProductDetailsModel>  result = state.searchResult.products??[];
         
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) {
                return ItemWidget(product: result[index], token: token, userId: userId);

           
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
                mainAxisExtent: MediaQuery.sizeOf(context).height * 0.30,
                mainAxisSpacing: 20,
                crossAxisSpacing: 25,
              ),
            ),
          );
        }
        if (state is SearchTabErrorState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "no Items Found",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
