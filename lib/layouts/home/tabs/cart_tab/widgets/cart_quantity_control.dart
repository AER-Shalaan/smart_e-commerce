import 'package:flutter/material.dart';

class CartQuantityControl extends StatelessWidget {
  final int quantity;
  final bool isUpdating;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;

  const CartQuantityControl({
    super.key, 
    required this.quantity,
    required this.isUpdating,
    this.onIncrease,
    this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text(
          "Quantity:",
          style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13.5),
        ),
        const SizedBox(width: 4),
        if (isUpdating)
          const SizedBox(
            width: 28,
            height: 28,
            child: CircularProgressIndicator(strokeWidth: 2.1),
          )
        else
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                splashRadius: 15,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: onDecrease,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.09),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "$quantity",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13.5,
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                splashRadius: 15,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: onIncrease,
              ),
            ],
          ),
      ],
    );
  }
}
