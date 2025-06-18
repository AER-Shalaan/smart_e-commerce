import 'package:flutter/material.dart';
class CartDeleteButton extends StatelessWidget {
  final bool isDeleting;
  final VoidCallback onDelete;

  const CartDeleteButton({super.key, required this.isDeleting, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, anim) => FadeTransition(opacity: anim, child: child),
      child: isDeleting
          ? const SizedBox(
              width: 34,
              height: 34,
              child: CircularProgressIndicator(strokeWidth: 2.8),
            )
          : IconButton(
              key: const ValueKey("deleteBtn"),
              icon: const Icon(
                Icons.delete_outline_rounded,
                size: 28,
                color: Colors.redAccent,
              ),
              tooltip: "Delete item",
              onPressed: onDelete,
            ),
    );
  }
}
