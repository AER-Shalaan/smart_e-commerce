import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/resuebale_componants/product_list_builder.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/best_seller_data_source.dart';
import 'package:smart_ecommerce/di/di.dart';

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
    final bestSellerDataSource = getIt<BestSellerDataSource>();

    return ProductListBuilder(
      label: "Best Seller",
      token: token,
      userId: userId,
      fetchFunction:
          (page) =>
              bestSellerDataSource.getMostSelling(token: token, page: page),
    );
  }
}
