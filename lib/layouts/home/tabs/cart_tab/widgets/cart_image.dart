import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/constants.dart';
import 'package:smart_ecommerce/data/models/cart_model/cart_model.dart';

class CartImage extends StatelessWidget {
  final CartModel item;
  final VoidCallback onTap;

  const CartImage({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final imgWidth = width * 0.19 > 110 ? 110.0 : width * 0.19;
    final imgHeight = imgWidth * 0.8;

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          color: Theme.of(context).dividerColor.withAlpha(30),
          width: imgWidth,
          height: imgHeight,
          child: Image.network(
            Constants.baseUrl + item.imageCover,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Icon(
              Icons.broken_image,
              color: Theme.of(context).hintColor,
              size: imgWidth * 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
