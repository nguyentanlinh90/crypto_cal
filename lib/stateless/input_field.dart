import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../styles/app_text_styles.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final int maxLength;
  final TextInputType textInputType;
  // final VoidCallback? onChange;
  final Function(String)? onTextChanged;

  const InputField({
    Key? key,
    required this.controller,
    this.label = '',
    this.obscureText = false,
    this.maxLength = 20,
    this.textInputType = TextInputType.text,
    // this.onChange,
    this.onTextChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyles.h5().copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
      controller: controller,
      cursorColor: AppColors.primaryColor,
      obscureText: obscureText,
      maxLength: maxLength,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blackGrey, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
        ),
        labelText: label,
        labelStyle: AppTextStyles.h5().copyWith(color: AppColors.primaryColor),
        fillColor: AppColors.primaryColor,
      ),
      onChanged: (text) {
        onTextChanged!(text);
      },
    );
  }
}
