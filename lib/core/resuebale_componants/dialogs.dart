import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomDialogs {
  static void showErrorDialog(BuildContext context, String message) {
    _showDialog(
      context,
      icon: Icons.error_outline,
      iconColor: Theme.of(context).colorScheme.error,
      title: 'Error',
      content: message,
      actions: [
        _buildDialogButton(
          context: context,
          label: 'Try Again',
          onPressed: () => Navigator.pop(context),
          color: Theme.of(context).colorScheme.error,
        ),
      ],
    );
  }

  static void showLoadingDialog(BuildContext context) {
    final theme = Theme.of(context);
    _showDialog(
      context,
      icon: Icons.warning_amber_outlined,
      iconColor: theme.colorScheme.secondary,
      title: 'Loading...',
      customContent: LoadingAnimationWidget.fourRotatingDots(
        color: theme.colorScheme.primary.withAlpha(153),
        size: MediaQuery.of(context).size.width * 0.13,
      ),
      barrierDismissible: true,
    );
  }

  static void showConfirmationDialog(
    BuildContext context, {
    required String title,
    required String content,
    required VoidCallback onConfirm,
    required IconData icon,
    required Color iconColor,
    required String cancelLabel,
    Widget? customContent,
    required String confirmationLabel,
    required Color confirmationColor,
  }) {
    _showDialog(
      context,
      icon: icon,
      iconColor: iconColor,
      title: title,
      customContent: customContent,
      content: content,
      actions: [
        _buildDialogButton(
          context: context,
          label: cancelLabel,
          onPressed: () => Navigator.pop(context),
          color: Theme.of(context).disabledColor,
          isOutlined: true,
        ),
        const SizedBox(width: 16),
        _buildDialogButton(
          context: context,
          label: confirmationLabel,
          onPressed: () {
            Navigator.pop(context);
            onConfirm();
          },
          color: confirmationColor,
        ),
      ],
    );
  }

  static void closeDialogs(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  static void _showDialog(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    String? content,
    Widget? customContent,
    List<Widget>? actions,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        final theme = Theme.of(context);

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            width: screenWidth * 0.8,
            padding: EdgeInsets.all(screenWidth * 0.05),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: iconColor, size: screenWidth * 0.12),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: screenWidth * 0.05,
                  ),
                ),
                if (content != null) ...[
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    content,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                ],
                if (customContent != null) ...[customContent],
                if (actions != null) ...[
                  SizedBox(height: screenHeight * 0.03),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: actions,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _buildDialogButton({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
    required Color color,
    bool isOutlined = false,
  }) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child:
          isOutlined
              ? OutlinedButton(
                onPressed: onPressed,
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: BorderSide(color: color),
                ),
                child: Text(
                  label,
                  style: theme.textTheme.labelLarge?.copyWith(color: color),
                ),
              )
              : ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  label,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
    );
  }
}
