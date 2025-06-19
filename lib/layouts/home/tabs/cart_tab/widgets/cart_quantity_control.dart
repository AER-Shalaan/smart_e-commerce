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

    final screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth * 0.065;    // تقريبًا 24 على شاشة 370
    double fontSize = screenWidth * 0.036;    // تقريبًا 13.5 على شاشة 375
    double boxHeight = screenWidth * 0.09;    // تقريبًا 34 على شاشة 375
    double boxPaddingH = screenWidth * 0.021; // تقريبًا 8 على شاشة 375

    // عشان الشكل يفضل طبيعي على كل الشاشات
    iconSize = iconSize.clamp(18.0, 28.0);
    fontSize = fontSize.clamp(11.0, 16.0);
    boxHeight = boxHeight.clamp(22.0, 38.0);
    boxPaddingH = boxPaddingH.clamp(6.0, 14.0);

    return Row(
      children: [
        Text(
          "Quantity:",
          style: theme.textTheme.bodyMedium?.copyWith(fontSize: fontSize),
        ),
        SizedBox(width: 4),
        if (isUpdating)
          SizedBox(
            width: boxHeight,
            height: boxHeight,
            child: CircularProgressIndicator(strokeWidth: iconSize / 11),
          )
        else
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove_circle_outline, size: iconSize),
                splashRadius: iconSize + 3,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(
                  minWidth: boxHeight,
                  minHeight: boxHeight,
                ),
                onPressed: onDecrease,
              ),
              Container(
                height: boxHeight,
                padding: EdgeInsets.symmetric(horizontal: boxPaddingH, vertical: 2),
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.09),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  "$quantity",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize,
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add_circle_outline, size: iconSize),
                splashRadius: iconSize + 3,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(
                  minWidth: boxHeight,
                  minHeight: boxHeight,
                ),
                onPressed: onIncrease,
              ),
            ],
          ),
      ],
    );
  }
}
