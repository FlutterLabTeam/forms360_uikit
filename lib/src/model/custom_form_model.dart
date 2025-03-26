import 'package:flutter/material.dart';

class CustomFormFieldModel {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isSuffixIconEnabled;
  final Icon? suffixIcon;
  final Function()? suffixIconOnPressed;
  final double? width;
  final bool isEnabled;

  CustomFormFieldModel({
    required this.label,
    required this.hintText,
    required this.controller,
    required this.onChanged,
    required this.validator,
    this.width,
    this.suffixIcon,
    this.suffixIconOnPressed,
    this.isSuffixIconEnabled = false,
    this.isEnabled = true,
  });
}
