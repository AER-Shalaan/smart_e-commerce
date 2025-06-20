import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/utils/app_colors.dart';
import 'package:smart_ecommerce/data/models/order_model/order_model.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  const OrderCard({super.key, required this.order});

  Color _statusColor(BuildContext context) {
    final theme = Theme.of(context);
    switch (order.status.toLowerCase()) {
      case "success":
        return theme.colorScheme.secondary; // Success color
      case "failed":
      case "canceled":
        return theme.colorScheme.error;
      case "pending":
        return AppColors.accent3; // Use theme if exists
      default:
        return theme.colorScheme.primary;
    }
  }

  IconData _statusIcon() {
    switch (order.status.toLowerCase()) {
      case "success":
        return Icons.check_circle_rounded;
      case "failed":
      case "canceled":
        return Icons.cancel_rounded;
      case "pending":
        return Icons.access_time_rounded;
      default:
        return Icons.info_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: theme.cardTheme.elevation ?? 4,
      shape:
          theme.cardTheme.shape ??
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      margin:
          theme.cardTheme.margin ??
          const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status & Date
            Row(
              children: [
                Icon(_statusIcon(), color: _statusColor(context), size: 30),
                const SizedBox(width: 8),
                Text(
                  order.status,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: _statusColor(context),
                  ),
                ),
                const Spacer(),
                Text(
                  "Ordered: ${order.bookDate.toString().substring(0, 10)}",
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Buyer + Total Price
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: theme.colorScheme.secondary.withOpacity(
                    0.12,
                  ),
                  child: Icon(Icons.person, color: theme.colorScheme.secondary),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    order.buyerName,
                    style: theme.textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "${order.totalPrice.toStringAsFixed(2)} EGP",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Divider(height: 18, color: theme.dividerColor),
            // Address
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on,
                  color: theme.colorScheme.secondary,
                  size: 22,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "${order.building} ${order.street}, ${order.city}",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.75),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Apartment & Floor
            Row(
              children: [
                Icon(
                  Icons.home,
                  size: 18,
                  color: theme.colorScheme.primary.withAlpha(180),
                ),
                const SizedBox(width: 5),
                Text(
                  "Apt: ${order.apartment}",
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(width: 14),
                Icon(
                  Icons.stairs,
                  size: 18,
                  color: theme.colorScheme.primary.withAlpha(180),
                ),
                const SizedBox(width: 5),
                Text("Floor: ${order.floor}", style: theme.textTheme.bodySmall),
              ],
            ),
            const SizedBox(height: 10),
            // Phone
            Row(
              children: [
                Icon(Icons.phone, size: 18, color: theme.colorScheme.secondary),
                const SizedBox(width: 6),
                Text(order.phoneNumber, style: theme.textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
