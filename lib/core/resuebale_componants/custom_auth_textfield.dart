import 'package:flutter/material.dart';

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
  final Color? borderColor;
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
    this.borderColor,
    this.focusNode,
    this.onEditingComplete,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Color effectiveBorderColor =
        borderColor ?? theme.colorScheme.primary;

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
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
              color: theme.hintColor,
              fontWeight: FontWeight.w400,
            ),
            suffixIcon: suffixIcon,
            suffixIconConstraints: suffixIconConstraints,
            prefixIcon: prefixIcon,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.dividerColor,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: effectiveBorderColor, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: effectiveBorderColor, width: 2),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.disabledColor, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w400,
          ),
        ),
        if (errorMessage != null && errorMessage!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              errorMessage!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
