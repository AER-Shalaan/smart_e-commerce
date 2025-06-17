import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/utils/app_colors.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/add_to_wishlist_view_model/add_to_wishlist_view_model.dart';

AppBar productDetailsViewAppBar(
  BuildContext context, {
  required String token,
  required String userId,
  required String productId,
}) {
  return AppBar(
    title: Text(
      "Product Details",
      style: Theme.of(context).textTheme.bodyMedium,
    ),
    backgroundColor: AppColors.backGroundColor,
    surfaceTintColor: Colors.transparent,
    centerTitle: true,
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back_ios),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ElevatedButton(
          onPressed: () {
            context.read<AddToWishlistViewModel>().addToWishlist(
              token: token,
              userId: userId,
              itemId: productId,
            );
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(8),
            backgroundColor: AppColors.primary.withAlpha((255 * 0.1).toInt()),
            elevation: 0,
          ),
          child: const Icon(Icons.favorite_border, color: AppColors.primary),
        ),
      ),
    ],
  );
}
