import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/my_orders/models/order.dart';
import 'package:timelines_plus/timelines_plus.dart';

class OrderTimeLine extends StatelessWidget {
  const OrderTimeLine({
    super.key,
    required this.orderStatuses,
    required this.selectedStatusIndex,
  });
  final List<OrderStatus> orderStatuses;
  final int selectedStatusIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FixedTimeline.tileBuilder(
      builder: TimelineTileBuilder.connectedFromStyle(
        contentsAlign: ContentsAlign.alternating,
        connectionDirection: ConnectionDirection.before,
        connectorStyleBuilder: (context, index) {
          return (index < selectedStatusIndex)
              ? ConnectorStyle.solidLine
              : ConnectorStyle.dashedLine;
        },
        indicatorStyleBuilder: (context, index) {
          return (index < selectedStatusIndex)
              ? IndicatorStyle.dot
              : (index == selectedStatusIndex)
              ? IndicatorStyle.outlined
              : IndicatorStyle.outlined;
        },
        itemExtent: 100,
        itemCount: orderStatuses.length,
        contentsBuilder: (context, index) {
          final order = orderStatuses[index];
          final isActive = (index <= selectedStatusIndex);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.status,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color:
                        isActive
                            ? theme.colorScheme.primary
                            : theme.disabledColor,
                  ),
                ),
                Text(
                  order.location,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    color: theme.hintColor,
                  ),
                ),
                Text(
                  DateFormat('yyyy-MM-dd HH:mm').format(order.timestamp),
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    color: theme.disabledColor,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
