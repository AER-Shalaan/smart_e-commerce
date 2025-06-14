import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/resuebale_componants/product_list_builder.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/featured_product_data_source.dart';
import 'package:smart_ecommerce/di/di.dart';

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
    final featuredProductDataSource = getIt<FeaturedProductDataSource>();

    return ProductListBuilder(
      label: "Featured Product",
      token: token,
      userId: userId,
      fetchFunction:
          (page) => featuredProductDataSource.getFeaturedProducts(
            token: token,
            page: page,
          ),
    );
  }
}
