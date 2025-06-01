import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:forms360_uikit/src/theme/text/texts.dart';
import 'package:forms360_uikit/src/model/input_types.dart';

class PhoneInput extends StatefulWidget {
  final String label;
  final double? width;
  final bool isEnabled;
  final int? maxLength;
  final double? height;
  final String hintText;
  final Icon? suffixeIcon;
  final Widget? prefixWidget;
  final String? initialValue;
  final bool isSuffixIconEnabled;
  final Function(String)? onChanged;
  final Function()? suffixIconOnPressed;
  final TextEditingController? controller;
  final String? Function(PhoneNumber?)? validator;
  final Function(PhoneNumber)? onCountryCodeChanged;
  final PrimaryInputColorKit inputColor;
  final TextStyle? textStyle;
  final EdgeInsets? contentPadding;

  const PhoneInput({
    super.key,
    this.width,
    this.height,
    this.maxLength,
    this.onChanged,
    this.validator,
    this.controller,
    this.suffixeIcon,
    this.prefixWidget,
    this.initialValue,
    required this.label,
    this.isEnabled = true,
    required this.hintText,
    this.suffixIconOnPressed,
    this.isSuffixIconEnabled = false,
    required this.onCountryCodeChanged,
    this.textStyle,
    this.contentPadding,
    PrimaryInputColorKit? inputColor,
  }) : inputColor = inputColor ?? PrimaryInputColorKit.BLUE;

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  PhoneNumber? currentPhoneNumber;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null && widget.initialValue!.isNotEmpty) {
      currentPhoneNumber = PhoneNumber.parse(widget.initialValue!);
    } else {
      final countryCode =
          PlatformDispatcher.instance.locale.countryCode ?? 'US';
      currentPhoneNumber = PhoneNumber(
        isoCode: IsoCode.values.firstWhere(
          (code) => code.toString().split('.').last == countryCode,
          orElse: () => IsoCode.US,
        ),
        nsn: '',
      );
    }
  }

  Color _generateColorInput() {
    if (widget.inputColor == PrimaryInputColorKit.BLACK) return Colors.black;
    if (widget.inputColor == PrimaryInputColorKit.WHITE) return Colors.white;
    return Theme.of(context).colorScheme.primary;
  }

  @override
  Widget build(BuildContext context) {
    return PhoneFormField(
      initialValue: currentPhoneNumber != null
          ? PhoneNumber(
              isoCode: IsoCode.values.firstWhere(
                (code) =>
                    code.toString().split('.').last ==
                    currentPhoneNumber!.isoCode.toString().split('.').last,
                orElse: () => IsoCode.US,
              ),
              nsn: widget.controller?.text ?? '',
            )
          : null,
      decoration: InputDecoration(
        counterText: "",
        prefix: widget.prefixWidget,
        labelText: widget.label,
        hintText: widget.hintText,
        labelStyle: widget.textStyle ??
            AppearanceKitTextTheme.build()
                .input
                .copyWith(color: _generateColorInput(), fontSize: 20),
        hintStyle: widget.textStyle ??
            AppearanceKitTextTheme.build()
                .input
                .copyWith(color: _generateColorInput(), fontSize: 20),
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
            EdgeInsets.only(top: 18, bottom: 22, left: 19.21, right: 19.21),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _generateColorInput()),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _generateColorInput()),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _generateColorInput()),
        ),
        suffixIcon: widget.isSuffixIconEnabled
            ? GestureDetector(
                child: Icon(
                  widget.suffixeIcon?.icon,
                  size: 32,
                  color: widget.suffixeIcon?.color,
                ),
                onTap: widget.suffixIconOnPressed,
              )
            : null,
      ),
      onChanged: (PhoneNumber? phoneNumber) {
        if (phoneNumber != null) {
          widget.onCountryCodeChanged?.call(phoneNumber);
        }
      },
      validator: widget.validator,
      enabled: widget.isEnabled,
      style: widget.textStyle ??
          AppearanceKitTextTheme.build()
              .input
              .copyWith(color: _generateColorInput(), fontSize: 20),
    );
  }
}
