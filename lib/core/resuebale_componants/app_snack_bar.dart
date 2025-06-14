import 'package:flutter/material.dart';

class AppSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    IconData icon = Icons.error,
    Color backgroundColor = Colors.red,
    Duration duration = const Duration(seconds: 2),
    bool fromTop = false,
  }) {
    if (fromTop) {
      _showTopSnackbar(
        context: context,
        message: message,
        icon: icon,
        backgroundColor: backgroundColor,
        duration: duration,
      );
    } else {
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: duration,
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
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
    required Duration duration,
  }) {
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
                    Icon(icon, color: Colors.white),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        message,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
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
