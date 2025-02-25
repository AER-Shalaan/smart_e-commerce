import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class CustomDialogs {
  static void showErrorDialog(BuildContext context, String message) {
    _showDialog(
      context,
      icon: Icons.error_outline,
      iconColor: Colors.red,
      title: 'Error',
      content: message,
      actions: [
        _buildDialogButton(
          label: 'Try Again',
          onPressed: () => Navigator.pop(context),
          color: Colors.redAccent,
        ),
      ],
    );
  }

  static void showLoadingDialog(BuildContext context) {
    _showDialog(
      context,
      icon: Icons.warning_amber_outlined,
      iconColor: Colors.amber[700]!,
      title: 'Loading...',
      customContent: LoadingAnimationWidget.fourRotatingDots(
        color: AppColors.primary.withOpacity(0.6),
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
    required String confirmationLabel,
    required Color confirmationColor,
  }) {
    _showDialog(
      context,
      icon: icon,
      iconColor: iconColor,
      title: title,
      content: content,
      actions: [
        _buildDialogButton(
          label: cancelLabel,
          onPressed: () => Navigator.pop(context),
          color: Colors.grey,
          isOutlined: true,
        ),
        const SizedBox(width: 16),
        _buildDialogButton(
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

        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            width: screenWidth * 0.8,
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: iconColor, size: screenWidth * 0.12),
                SizedBox(height: screenHeight * 0.02),
                Text(title,
                    style: TextStyles.dialogTitleStyle
                        .copyWith(fontSize: screenWidth * 0.05)),
                if (content != null) ...[
                  SizedBox(height: screenHeight * 0.01),
                  Text(content,
                      textAlign: TextAlign.center,
                      style: TextStyles.dialogMessageStyle
                          .copyWith(fontSize: screenWidth * 0.035)),
                ],
                if (customContent != null) ...[
                  customContent,
                ],
                if (actions != null) ...[
                  SizedBox(height: screenHeight * 0.03),
                  Row(mainAxisSize: MainAxisSize.min, children: actions),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _buildDialogButton({
    required String label,
    required VoidCallback onPressed,
    required Color color,
    bool isOutlined = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: isOutlined
          ? OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                side: BorderSide(color: color),
              ),
              child: Text(label,
                  style:
                      TextStyles.dialogLabelButtonStyle.copyWith(color: color)),
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(label, style: TextStyles.dialogLabelButtonStyle),
            ),
    );
  }
}
