import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/theme/text/texts.dart';
import 'package:forms360_uikit/src/model/input_types.dart';

class PrimaryDateInput extends StatelessWidget {
  const PrimaryDateInput({
    super.key,
    this.label,
    this.maxLength,
    this.fontSize,
    this.textStyle,
    this.controller,
    this.initialValue,
    this.onIconPressed,
    this.contentPadding,
    this.enabled = true,
    this.isClearButtonVisible = false,
    this.onTapOutside,
    required this.hintText,
    required this.onTap,
    required this.validator,
    PrimaryInputColorKit? inputColor,
  }) : inputColor = inputColor ?? PrimaryInputColorKit.BLUE;

  final bool enabled;
  final String? label;
  final int? maxLength;
  final String hintText;
  final double? fontSize;
  final TextStyle? textStyle;
  final String? initialValue;
  final EdgeInsets? contentPadding;
  final void Function()? onIconPressed;
  final PrimaryInputColorKit inputColor;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final GestureTapCallback? onTap;
  final bool isClearButtonVisible;
  final void Function()? onTapOutside;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 60),
          child: TextFormField(
            key: key,
            enabled: enabled,
            maxLength: maxLength,
            maxLines: 1,
            controller: controller,
            initialValue: initialValue,
            decoration: InputDecoration(
              counterText: "",
              isDense: true,
              prefixIcon: Icon(
                Icons.date_range,
                color: _generateColorInput(context),
              ),
              hintText: hintText,
              labelText: label,
              labelStyle:
                  textStyle ??
                  AppearanceKitTextTheme.build().input.copyWith(
                    color: _generateColorInput(context),
                    fontSize: 20,
                  ),
              fillColor: inputColor == PrimaryInputColorKit.TRANSPARENT
                  ? Colors.transparent
                  : null,
              hintStyle:
                  textStyle ??
                  AppearanceKitTextTheme.build().input.copyWith(
                    color: _generateColorInput(context),
                    fontSize: 20,
                  ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: inputColor == PrimaryInputColorKit.BLACK
                      ? Colors.black
                      : enabled
                      ? Theme.of(context).colorScheme.primary
                      : Color(0xff99B3C6),
                ),
              ),
              contentPadding:
                  contentPadding ??
                  EdgeInsets.only(
                    top: 18,
                    bottom: 22,
                    left: 19.21,
                    right: 19.21,
                  ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: _generateColorInput(context)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: _generateColorInput(context)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: _generateColorInput(context)),
              ),
              suffixIcon:
                  isClearButtonVisible && controller?.text.isNotEmpty == true
                  ? IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: _generateColorInput(context),
                      ),
                      onPressed: () {
                        controller?.clear();
                        onTapOutside?.call();
                      },
                    )
                  : null,
            ),
            validator: validator,
            cursorColor: _generateColorInput(context),
            textInputAction: TextInputAction.done,
            style:
                textStyle ??
                AppearanceKitTextTheme.build().input.copyWith(
                  color: _generateColorInput(context),
                  fontSize: 20,
                ),
          ),
        ),
      ),
    );
  }

  Color _generateColorInput(BuildContext context) {
    if (inputColor == PrimaryInputColorKit.BLACK) return Colors.black;
    if (inputColor == PrimaryInputColorKit.WHITE) return Colors.white;
    if (inputColor == PrimaryInputColorKit.TRANSPARENT) return Colors.white;
    return Theme.of(context).colorScheme.primary;
  }
}
