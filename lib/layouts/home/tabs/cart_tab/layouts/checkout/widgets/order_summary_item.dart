import 'package:flutter/material.dart';

class OrderSummaryItem extends StatelessWidget {
  const OrderSummaryItem({
    super.key,
    required this.name,
    required this.quantity,
    required this.price,
    this.isHeader = false,
  });

  final String name;
  final String quantity;
  final String price;
  final bool isHeader;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final bgColor =
        isHeader ? colorScheme.primary.withAlpha(50) : Colors.transparent;

    final borderRadius = BorderRadius.circular(isHeader ? 16 : 0);

    // هنا صغرت حجم خط الهيدر وبقي 14
    final TextStyle headerStyle = textTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.w700,
      color: colorScheme.primary,
      letterSpacing: 0.4,
      fontSize: 14,
    );
    final TextStyle nameStyle =
        isHeader
            ? headerStyle
            : textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurface.withAlpha(220),
            );
    final TextStyle quantityStyle =
        isHeader
            ? headerStyle
            : textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w400,
              color: colorScheme.onSurface.withAlpha(160),
            );
    final TextStyle priceStyle =
        isHeader
            ? headerStyle.copyWith(fontWeight: FontWeight.w800)
            : textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.primary,
            );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: isHeader ? 8 : 4, horizontal: 8),
      child: Container(
        decoration: BoxDecoration(color: bgColor, borderRadius: borderRadius),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 4,
                ),
                child: Text(
                  name,
                  style: nameStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: isHeader ? TextAlign.left : TextAlign.start,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  quantity,
                  style: quantityStyle,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Text(
                    price,
                    style: priceStyle,
                    maxLines: 1,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
