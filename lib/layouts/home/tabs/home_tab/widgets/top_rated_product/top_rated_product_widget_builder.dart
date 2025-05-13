import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/resuebale_componants/product_list_builder.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/top_rated_data_source.dart';
import 'package:smart_ecommerce/di/di.dart';

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
    final topRatedDataSource = getIt<TopRatedDataSource>();
    return ProductListBuilder(
      label: "Top Rated Product",
      token: token,
      userId: userId,
      fetchFunction:
          (page) => topRatedDataSource.getTopRated(token: token, page: page),
    );
  }
}
