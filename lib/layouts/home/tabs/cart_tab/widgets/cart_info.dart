import 'package:flutter/material.dart';
import 'cart_delete_button.dart';
import 'cart_quantity_control.dart';
import 'package:smart_ecommerce/data/models/cart_model/cart_model.dart';

class CartInfo extends StatelessWidget {
  final CartModel item;
  final bool isUpdating;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;
  final bool isDeleting;
  final String token;
  final String userId;

  const CartInfo({
    super.key,
    required this.item,
    required this.isUpdating,
    required this.isDeleting,
    required this.token,
    required this.userId,
    this.onIncrease,
    this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    // ريسبونسيف: المقاسات تتظبط حسب عرض الشاشة
    double fontTitle = (screenWidth * 0.042).clamp(14.5, 19.5);
    double fontPrice = (screenWidth * 0.041).clamp(13.5, 17.5);
    double fontDiscount = (screenWidth * 0.036).clamp(11.0, 15.0);
    double verticalPad = (screenWidth * 0.012).clamp(3.0, 8.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.itemName,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: fontTitle,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: verticalPad),
        if (item.discount > 0) ...[
          Text(
            "${item.priceOut} EGP",
            style: theme.textTheme.bodyMedium?.copyWith(
              decoration: TextDecoration.lineThrough,
              color: theme.hintColor,
              fontSize: fontDiscount,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${item.priceOut - item.discount} EGP",
                style: TextStyle(
                  color: Colors.green[700],
                  fontWeight: FontWeight.bold,
                  fontSize: fontPrice,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: (screenWidth * 0.016).clamp(4.0, 10.0),
                  vertical: (screenWidth * 0.004).clamp(1.0, 3.5),
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withAlpha((0.13 * 255).toInt()),
                  borderRadius: BorderRadius.circular(
                    (screenWidth * 0.016).clamp(4.0, 10.0),
                  ),
                ),
                child: Text(
                  "-${item.discount} EGP",
                  style: TextStyle(
                    color: Colors.green[800],
                    fontWeight: FontWeight.w500,
                    fontSize: fontDiscount,
                  ),
                ),
              ),
              CartDeleteButton(
                isDeleting: isDeleting,
                onDelete: () {
                  // logic of delete
                },
              ),
            ],
          ),
        ] else ...[
          Text(
            "${item.priceOut} EGP",
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: fontPrice,
            ),
          ),
        ],
        CartQuantityControl(
          quantity: item.quantity,
          isUpdating: isUpdating,
          onIncrease: onIncrease,
          onDecrease: onDecrease,
        ),
      ],
    );
  }
}
