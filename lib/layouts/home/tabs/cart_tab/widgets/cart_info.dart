import 'package:flutter/material.dart';
import 'package:smart_ecommerce/data/models/cart_model/cart_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/cart_tab/widgets/cart_quantity_control.dart';

class CartInfo extends StatelessWidget {
  final CartModel item;
  final bool isUpdating;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;

  const CartInfo({
    super.key,
    required this.item,
    required this.isUpdating,
    this.onIncrease,
    this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.itemName,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16.2,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 5),
        if (item.discount > 0) ...[
          Text(
            "${item.priceOut} EGP",
            style: theme.textTheme.bodyMedium?.copyWith(
              decoration: TextDecoration.lineThrough,
              color: theme.hintColor,
            ),
          ),
          Row(
            children: [
              Text(
                "${item.priceOut - item.discount} EGP",
                style: TextStyle(
                  color: Colors.green[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 1.5,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withAlpha((0.13 * 255).toInt()),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "-${item.discount} EGP",
                  style: TextStyle(
                    color: Colors.green[800],
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
        ] else ...[
          Text(
            "${item.priceOut} EGP",
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
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
