import 'package:flutter/material.dart';

class CustomMainButton extends StatelessWidget {
  final Widget? icon;
  final String label;
  final Color? labelColor;
  final Color? buttonColor;
  final bool isDisabled;
  final double width;
  final double height;
  final BorderSide? borderSide;
  final double? fontSize;
  final void Function()? onPressed;

  const CustomMainButton({
    super.key,
    this.icon,
    required this.label,
    this.labelColor,
    this.buttonColor,
    this.onPressed,
    this.width = 341,
    this.height = 55,
    this.borderSide,
    this.fontSize = 16,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: isDisabled ? null : onPressed,
          style: ButtonStyle(
            alignment: Alignment.center,
            backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (isDisabled) {
                return theme.disabledColor.withOpacity(0.7);
              }
              return buttonColor ?? theme.colorScheme.secondary;
            }),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: borderSide ?? BorderSide.none,
              ),
            ),
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (states) =>
                  states.contains(WidgetState.pressed)
                      ? theme.colorScheme.primary.withOpacity(0.08)
                      : null,
            ),
            elevation: WidgetStateProperty.resolveWith<double>(
              (states) => isDisabled ? 0 : 4,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[icon!, const SizedBox(width: 10)],
              Text(
                label,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: labelColor ?? theme.colorScheme.onSecondary,
                  fontWeight: FontWeight.w600,
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
