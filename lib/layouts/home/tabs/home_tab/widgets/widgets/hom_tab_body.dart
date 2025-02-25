import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../advertisements/adv_widget_builder.dart';
import '../advertisements/provider/adv_provider.dart';
import '../advertisments2/adv_widget_builder2.dart';
import '../best_seller/beast_seller_widget_buider.dart';
import '../categorys/category_widget_builder.dart';
import '../featured _product/featured _product_widget_builder.dart';
import '../new_arrivals/new_arrivals_widget_builder.dart';
import '../recommended/recommended_widget_builder.dart';
import '../top_rated_product/top_rated_product_widget_builder.dart';

class HomeTabBody extends StatelessWidget {
  const HomeTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverSizedBoxSpace(height: 20),
        SliverToBoxAdapter(
          child: ChangeNotifierProvider(
            create: (context) => AdvProvider(),
            child: const AdvWidgetBuilder(),
          ),
        ),
        const SliverSizedBoxSpace(height: 30),
        const CategoryWidgetBuilder(),
        const SliverSizedBoxSpace(height: 30),
        const RecommendedWidgetBuilder(),
        const SliverSizedBoxSpace(height: 30),
        const BeastSellerWidgetBuider(),
        const SliverSizedBoxSpace(height: 30),
        const NewArrivalsWidgetBuilder(),
        const SliverSizedBoxSpace(height: 30),
        const TopRatedProductWidgetBuilder(),
        const SliverSizedBoxSpace(height: 30),
        const AdvWidgetBuilder2(),
        const SliverSizedBoxSpace(height: 30),
        const FeaturedProductWidgetBuilder(),
        const SliverSizedBoxSpace(height: 10),
      ],
    );
  }
}

class SliverSizedBoxSpace extends StatelessWidget {
  const SliverSizedBoxSpace({super.key, this.height = 0, this.width = 0});
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: SizedBox(height: height, width: width));
  }
}
