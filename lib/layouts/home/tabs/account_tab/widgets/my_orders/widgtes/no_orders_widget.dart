import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/utils/styles.dart';

class NoOrdersWidget extends StatelessWidget {
  final ThemeData theme;
  const NoOrdersWidget({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            color: theme.colorScheme.secondary,
            size: 66,
          ),
          const SizedBox(height: 16),
          Text(
            "No orders found",
            style: Styles.header3Semibold.copyWith(
              color: theme.colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "You haven't placed any orders yet.",
            style: Styles.body2Regular.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
