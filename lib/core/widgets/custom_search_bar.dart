import 'package:flipkart_clone/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final bool filled;
  final Color? fillColor;
  final String? hintText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final Widget? hint;

  const CustomSearchBar({
    super.key,
    this.filled = false,
    this.fillColor,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: filled,
        fillColor: fillColor ?? Colors.transparent,
        hintText: hintText,
        prefixIcon: Icon(prefixIcon ?? Icons.abc),
        suffixIcon: Icon(suffixIcon ?? Icons.abc),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
