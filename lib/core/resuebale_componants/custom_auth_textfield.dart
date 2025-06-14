import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

typedef FieldValidation = String? Function(String?)?;
typedef OnChanged = void Function(String)?;
typedef OnEditingComplete = void Function()?;

class CustomAuthTextField extends StatelessWidget {
  final String hint;
  final TextInputType? keyboard;
  final bool obscure;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final Widget? prefixIcon;
  final FieldValidation validator;
  final TextEditingController? controller;
  final OnChanged? onChanged;
  final Color borderColor;
  final FocusNode? focusNode;
  final OnEditingComplete? onEditingComplete;
  final String? errorMessage;

  const CustomAuthTextField({
    super.key,
    required this.hint,
    this.keyboard,
    this.obscure = false,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    required this.controller,
    this.onChanged,
    this.suffixIconConstraints,
    this.borderColor = AppColors.primary,
    this.focusNode,
    this.onEditingComplete,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          obscureText: obscure,
          keyboardType: keyboard,
          onChanged: onChanged,
          focusNode: focusNode,
          onEditingComplete: onEditingComplete,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.dmSans(
              fontWeight: FontWeight.w400,
              color: AppColors.primary.withAlpha(102),
              fontSize: 16,
            ),
            suffixIcon: suffixIcon,
            suffixIconConstraints: suffixIconConstraints,
            prefixIcon: prefixIcon,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primary.withAlpha(102),
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: borderColor, width: 2),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          style: GoogleFonts.dmSans(
            fontWeight: FontWeight.w400,
            color: AppColors.primary,
            fontSize: 16,
          ),
        ),
        // Display error message if any
        if (errorMessage != null && errorMessage!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              errorMessage!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
