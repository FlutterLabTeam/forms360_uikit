import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/extension/context_extension.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
    required this.label,
    required this.hintText,
    this.validator,
    this.controller,
  });

  final String label;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.primary,
        ),
        hintText: hintText,
        labelText: label,
        labelStyle: context.primaryText.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xFFC0CDE1),
        ),
        hintStyle: context.primaryText.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFFC0CDE1),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFF5F7FA),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFF5F7FA),
          ),
        ),
        focusedBorder: OutlineInputBorder(
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
      validator: validator,
    );
  }
}
