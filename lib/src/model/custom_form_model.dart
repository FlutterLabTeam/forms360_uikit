import 'package:flutter/material.dart';

class CustomFormFieldModel {
  final String label;
  final double? width;
  final double? height;
  final bool isEnabled;
  final int? maxLength;
  final String hintText;
  final Icon? suffixIcon;
  final bool isSuffixIconEnabled;
  final Function(String)? onChanged;
  final Function()? suffixIconOnPressed;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? prefixWidget;

  CustomFormFieldModel({
    this.width,
    this.height,
    this.prefixWidget,
    this.onChanged,
    this.maxLength,
    this.suffixIcon,
    required this.label,
    this.isEnabled = true,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.suffixIconOnPressed,
    this.isSuffixIconEnabled = false,
  });
}
