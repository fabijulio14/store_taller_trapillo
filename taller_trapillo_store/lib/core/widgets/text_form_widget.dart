import 'package:flutter/material.dart';
import '../features/app_colors.dart';

class TextFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int maxLines;
  final Widget? suffixIcon;
  final String? hintText;
  final bool enabled;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? contentPadding;

  const TextFormWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.maxLines = 1,
    this.suffixIcon,
    this.hintText,
    this.enabled = true,
    this.onTap,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            hintText: hintText,
            suffixIcon: suffixIcon,
            contentPadding:
                contentPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.borderGrey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.borderGrey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.error, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.error, width: 2),
            ),
            filled: true,
            fillColor: enabled ? AppColors.backgroundWhite : AppColors.backgroundDisabled,
          ),
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLines: maxLines,
          enabled: enabled,
          onTap: onTap,
          style: TextStyle(
            fontSize: 16,
            color: enabled ? AppColors.textEnabled : AppColors.textDisabled,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
