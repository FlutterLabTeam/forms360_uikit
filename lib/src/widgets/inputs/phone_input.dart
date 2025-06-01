import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:forms360_uikit/src/theme/text/texts.dart';
import 'package:forms360_uikit/src/model/input_types.dart';

class PhoneInput extends StatefulWidget {
  final String label;
  final bool isEnabled;
  final int? maxLength;
  final String hintText;
  final Icon? suffixeIcon;
  final TextStyle? textStyle;
  final Widget? prefixWidget;
  final bool isSuffixIconEnabled;
  final PhoneNumber? initialValue;
  final EdgeInsets? contentPadding;
  final PhoneController? controller;
  final PrimaryInputColorKit inputColor;
  final Function()? suffixIconOnPressed;
  final String? Function(PhoneNumber?)? validator;
  final Function(PhoneNumber)? onCountryCodeChanged;

  const PhoneInput({
    super.key,
    this.maxLength,
    this.textStyle,
    this.validator,
    this.controller,
    this.suffixeIcon,
    this.prefixWidget,
    this.initialValue,
    this.contentPadding,
    required this.label,
    this.isEnabled = true,
    required this.hintText,
    this.suffixIconOnPressed,
    PrimaryInputColorKit? inputColor,
    this.isSuffixIconEnabled = false,
    required this.onCountryCodeChanged,
  }) : inputColor = inputColor ?? PrimaryInputColorKit.BLUE;

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  Color _generateColorInput() {
    if (widget.inputColor == PrimaryInputColorKit.BLACK) return Colors.black;
    if (widget.inputColor == PrimaryInputColorKit.WHITE) return Colors.white;
    return Theme.of(context).colorScheme.primary;
  }

  @override
  Widget build(BuildContext context) {
    return PhoneFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,
      decoration: InputDecoration(
        counterText: "",
        prefix: widget.prefixWidget,
        labelText: widget.label,
        hintText: widget.hintText,
        labelStyle: widget.textStyle ??
            AppearanceKitTextTheme.build().input.copyWith(
                  color: _generateColorInput(),
                  fontSize: 20,
                ),
        hintStyle: widget.textStyle ??
            AppearanceKitTextTheme.build().input.copyWith(
                  color: _generateColorInput(),
                  fontSize: 20,
                ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.inputColor == PrimaryInputColorKit.BLACK
                ? Colors.black
                : widget.isEnabled
                    ? Theme.of(context).colorScheme.primary
                    : Color(0xff99B3C6),
          ),
        ),
        contentPadding: widget.contentPadding ??
            EdgeInsets.only(
              top: 18,
              bottom: 22,
              left: 19.21,
              right: 19.21,
            ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _generateColorInput(),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _generateColorInput(),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _generateColorInput()),
        ),
        suffixIcon: widget.isSuffixIconEnabled
            ? GestureDetector(
                child: widget.suffixeIcon,
                onTap: widget.suffixIconOnPressed,
              )
            : null,
      ),
      onChanged: widget.onCountryCodeChanged,
      validator: widget.validator,
      enabled: widget.isEnabled,
      style: widget.textStyle ??
          AppearanceKitTextTheme.build()
              .input
              .copyWith(color: _generateColorInput(), fontSize: 20),
    );
  }
}
