import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

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
    this.buttonColor = AppColors.secondary,
    this.onPressed,
    this.width = 341,
    this.height = 55,
    this.borderSide,
    this.fontSize = 16,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: isDisabled ? null : onPressed,
          style: ButtonStyle(
            alignment: Alignment.center,
            backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (states) {
                if (isDisabled) {
                  return Colors.grey;
                }
                return buttonColor!;
              },
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: borderSide ?? BorderSide.none,
              ),
            ),
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (states) =>
                  states.contains(WidgetState.pressed) ? Colors.black12 : null,
            ),
            elevation: WidgetStateProperty.resolveWith<double>(
              (states) => isDisabled ? 0 : 4,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                icon!,
                const SizedBox(width: 10),
              ],
              Text(
                label,
                style: GoogleFonts.dmSans(
                  color: labelColor ?? Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
