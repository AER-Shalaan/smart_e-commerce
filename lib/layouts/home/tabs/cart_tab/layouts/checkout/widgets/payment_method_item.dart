import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    this.isSelected = false,
    required this.iconPath,
    this.hasLabel = false,
    this.label = '',
  });

  final bool isSelected;
  final String iconPath;
  final String label;
  final bool hasLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final Color borderColor = isSelected
        ? colorScheme.primary
        : colorScheme.secondary.withAlpha(40);
    final Color backgroundColor = isSelected
        ? colorScheme.primary
        : colorScheme.surface;
    final Color iconColor = isSelected
        ? colorScheme.onPrimary
        : colorScheme.primary;
    final Color textColor = isSelected
        ? colorScheme.onPrimary
        : colorScheme.onSurface;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      width: 109,
      height: 40,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor,
          width: 1.2,
        ),
        boxShadow: [
          if (isSelected)
            BoxShadow(
              color: colorScheme.primary.withAlpha(60),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            fit: BoxFit.scaleDown,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              iconColor,
              BlendMode.srcIn,
            ),
          ),
          if (hasLabel) ...[
            const SizedBox(width: 8),
            Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
