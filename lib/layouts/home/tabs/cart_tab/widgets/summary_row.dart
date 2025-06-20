import 'package:flutter/material.dart';

class SummaryRow extends StatelessWidget {
  final String label;
  final double value;

  const SummaryRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final labelStyle = theme.textTheme.bodyLarge;

    final valueStyle = theme.textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.bold,
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
