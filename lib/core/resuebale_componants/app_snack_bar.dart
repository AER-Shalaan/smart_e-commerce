import 'package:flutter/material.dart';

class AppSnackBar {
  static bool _isShowing = false;

  static void show({
    required BuildContext context,
    required String message,
    IconData icon = Icons.error,
    Color? backgroundColor,
    Color? textColor,
    Duration duration = const Duration(seconds: 2),
    bool fromTop = false,
  }) {
    if (_isShowing) return;
    _isShowing = true;
    Future.delayed(duration + const Duration(milliseconds: 300), () {
      _isShowing = false;
    });

    final theme = Theme.of(context);
    final Color bgColor = backgroundColor ?? theme.colorScheme.error;
    final Color txtColor = textColor ?? Colors.white;

    if (fromTop) {
      _showTopSnackbar(
        context: context,
        message: message,
        icon: icon,
        backgroundColor: bgColor,
        textColor: txtColor,
        duration: duration,
      );
    } else {
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: bgColor,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: duration,
        content: Row(
          children: [
            Icon(icon, color: txtColor),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: txtColor,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  static void _showTopSnackbar({
    required BuildContext context,
    required String message,
    required IconData icon,
    required Color backgroundColor,
    required Color textColor,
    required Duration duration,
  }) {
    final theme = Theme.of(context);
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder:
          (_) => Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            right: 16,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: backgroundColor.withAlpha(102),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(icon, color: textColor),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        message,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: textColor,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );

    overlay.insert(overlayEntry);
    Future.delayed(duration, overlayEntry.remove);
  }
}
