import 'package:flutter/material.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/Products.dart';

class RecommendedWidgetBuilder extends StatelessWidget {
  RecommendedWidgetBuilder({super.key});
  final List<Products> topRatedModel = [];

  //TODO form Recommended endpoint
  @override
  Widget build(BuildContext context) {
    return Container(height: MediaQuery.sizeOf(context).height * 0.2,);
  }
}

//ProductListBuilder(
    //   label: "Recommended for you",
    //   index: 0,
    //   products: topRatedModel,
    //   token: "",
    //   userId: '',
    // );