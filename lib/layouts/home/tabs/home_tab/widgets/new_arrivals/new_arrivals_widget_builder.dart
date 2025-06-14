import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/resuebale_componants/product_list_builder.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/new_arrivals_data_source.dart';
import 'package:smart_ecommerce/di/di.dart';

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
    final newArrivalsDataSource = getIt<NewArrivalsDataSource>();
    return ProductListBuilder(
      label: "New Arrivals",
      token: token,
      userId: userId,
      fetchFunction:
          (page) =>
              newArrivalsDataSource.getNewArrivals(token: token, page: page),
    );
  }
}
