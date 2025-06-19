import 'package:flutter/material.dart';

class CartDeleteButton extends StatelessWidget {
  final bool isDeleting;
  final VoidCallback onDelete;

  const CartDeleteButton({
    super.key,
    required this.isDeleting,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth * 0.07; // تقريباً 28 على شاشة 400
    double boxSize = screenWidth * 0.12; // تقريباً 48 على شاشة 400

    iconSize = iconSize.clamp(22.0, 36.0);
    boxSize = boxSize.clamp(32.0, 44.0);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, anim) =>
          FadeTransition(opacity: anim, child: child),
      child: isDeleting
          ? SizedBox(
              width: boxSize,
              height: boxSize,
              child: CircularProgressIndicator(strokeWidth: iconSize / 10),
            )
          : IconButton(
              key: const ValueKey("deleteBtn"),
              icon: Icon(
                Icons.delete_outline_rounded,
                size: iconSize,
                color: Colors.redAccent,
              ),
              tooltip: "Delete item",
              onPressed: onDelete,
              padding: EdgeInsets.all((boxSize - iconSize) / 2),
              constraints: BoxConstraints(
                minWidth: boxSize,
                minHeight: boxSize,
              ),
            ),
    );
  }
}
