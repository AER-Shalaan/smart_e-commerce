import 'package:flutter/material.dart';

class SummaryRow extends StatelessWidget {
  final String label;
  final int value;
  final bool isBold;
  final bool isBlack;

  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.isBlack = false,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final labelStyle = theme.textTheme.bodyLarge?.copyWith(
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      color: isBlack ? theme.colorScheme.onSurface : theme.disabledColor,
      fontSize: 16,
    );

    final valueStyle = theme.textTheme.bodyLarge?.copyWith(
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontSize: 16,
      color: theme.colorScheme.primary,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: labelStyle),
          Text('\$ $value', style: valueStyle),
        ],
      ),
    );
  }
}
