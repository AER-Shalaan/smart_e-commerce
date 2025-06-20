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
        size: _responsiveSize(context, mobile: 48, tablet: 64, desktop: 72),
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
        final theme = Theme.of(context);

        // Responsive max width
        double maxWidth = 400; // max for tablet & desktop
        double dialogWidth = screenWidth * 0.8;
        if (dialogWidth > maxWidth) dialogWidth = maxWidth;

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            width: dialogWidth,
            padding: EdgeInsets.all(
              _responsiveSize(context, mobile: 20, tablet: 28, desktop: 32),
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: iconColor,
                  size: _responsiveSize(
                    context,
                    mobile: 40,
                    tablet: 48,
                    desktop: 56,
                  ),
                ),
                SizedBox(
                  height: _responsiveSize(
                    context,
                    mobile: 12,
                    tablet: 18,
                    desktop: 22,
                  ),
                ),
                Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: _responsiveSize(
                      context,
                      mobile: 20,
                      tablet: 22,
                      desktop: 24,
                    ),
                  ),
                ),
                if (content != null) ...[
                  SizedBox(
                    height: _responsiveSize(
                      context,
                      mobile: 8,
                      tablet: 12,
                      desktop: 14,
                    ),
                  ),
                  Text(
                    content,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: _responsiveSize(
                        context,
                        mobile: 15,
                        tablet: 16,
                        desktop: 17,
                      ),
                    ),
                  ),
                ],
                if (customContent != null) ...[customContent],
                if (actions != null) ...[
                  SizedBox(
                    height: _responsiveSize(
                      context,
                      mobile: 22,
                      tablet: 28,
                      desktop: 32,
                    ),
                  ),
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
                  padding: EdgeInsets.symmetric(
                    vertical: _responsiveSize(
                      context,
                      mobile: 10,
                      tablet: 14,
                      desktop: 16,
                    ),
                  ),
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
                  padding: EdgeInsets.symmetric(
                    vertical: _responsiveSize(
                      context,
                      mobile: 10,
                      tablet: 14,
                      desktop: 16,
                    ),
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

  // Helper function for responsive sizes
  static double _responsiveSize(
    BuildContext context, {
    required double mobile,
    required double tablet,
    required double desktop,
  }) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 900) return desktop;
    if (width >= 600) return tablet;
    return mobile;
  }
}
