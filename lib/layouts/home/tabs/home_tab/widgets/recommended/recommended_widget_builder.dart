import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/resuebale_componants/product_list_builder.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/Products.dart';

class RecommendedWidgetBuilder extends StatelessWidget {
  RecommendedWidgetBuilder({super.key});
  final List<Products> topRatedModel = [];
  @override
  Widget build(BuildContext context) {
    return ProductListBuilder(
      label: "Recommended for you",
      index: 0,
      products: topRatedModel,
      token: "",
      userId: '',
    );
  }
}