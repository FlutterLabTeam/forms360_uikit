import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/extension/context_extension.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
    this.maxLength,
    this.validator,
    this.onChanged,
    this.controller,
    required this.label,
    required this.hintText,
  });

  final String label;
  final int? maxLength;
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        counterText: "",
        filled: true,
        fillColor: Color(0xFFF5F7FA),
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.primary,
        ),
        labelText: label,
        hintText: hintText,
        labelStyle: context.primaryText.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Color(0xFFC0CDE1),
        ),
        hintStyle: context.primaryText.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFFC0CDE1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Color(0xFFF5F7FA),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Color(0xFFF5F7FA),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Color(0xFFF5F7FA),
          ),
        ),
      ),
      cursorHeight: 16,
      style: context.primaryText.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.primary,
      ),
      cursorColor: Theme.of(context).colorScheme.primary,
      textInputAction: TextInputAction.done,
    );
  }
}
