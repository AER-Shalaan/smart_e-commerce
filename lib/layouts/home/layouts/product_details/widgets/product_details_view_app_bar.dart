import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/utils/app_colors.dart';

AppBar productDetailsViewAppBar(BuildContext context) {
  return AppBar(
    title: Text(
      "Product Details",
      style: Theme.of(context).textTheme.bodyMedium,
    ),
    backgroundColor: AppColors.backGroundColor,
    leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios)),
    centerTitle: true,
    surfaceTintColor: Colors.transparent,
  );
}
