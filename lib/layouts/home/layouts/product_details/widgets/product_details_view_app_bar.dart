import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/add_to_wishlist_view_model/add_to_wishlist_view_model.dart';

AppBar productDetailsViewAppBar(
  BuildContext context, {
  required String token,
  required String userId,
  required String productId,
}) {
  final theme = Theme.of(context);
  final colorScheme = theme.colorScheme;

  return AppBar(
    title: Text("Product Details"),
    backgroundColor: theme.scaffoldBackgroundColor,
    surfaceTintColor: Colors.transparent,
    centerTitle: true,
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(Icons.arrow_back_ios, color: colorScheme.onBackground),
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
            backgroundColor: colorScheme.primary.withOpacity(0.1),
            elevation: 0,
          ),
          child: Icon(Icons.favorite_border, color: colorScheme.primary),
        ),
      ),
    ],
  );
}
