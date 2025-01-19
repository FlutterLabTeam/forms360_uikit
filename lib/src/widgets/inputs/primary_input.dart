import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/theme/text/texts.dart';
import 'package:forms360_uikit/src/model/input_types.dart';

class PrimaryInput extends StatefulWidget {
  const PrimaryInput({
    super.key,
    this.fontSize,
    this.onChanged,
    this.maxLength,
    this.validator,
    this.textStyle,
    this.suffixIcon,
    this.controller,
    this.onIconPressed,
    this.contentPadding,
    this.onFieldSubmitted,
    this.isSuffixIconEnabled = false,
    required this.isBig,
    required this.label,
    required this.enabled,
    required this.hintText,
    required this.isPassword,
    required this.inputColor,
  });

  final bool isBig;
  final bool enabled;
  final String label;
  final int? maxLength;
  final String hintText;
  final bool isPassword;
  final double? fontSize;
  final Icon? suffixIcon;
  final TextStyle? textStyle;
  final bool isSuffixIconEnabled;
  final EdgeInsets? contentPadding;
  final void Function()? onIconPressed;
  final PrimaryInputColorKit inputColor;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final Function(String?)? onFieldSubmitted;
  final String? Function(String?)? validator;

  @override
  _PrimaryInputState createState() => _PrimaryInputState();
}

class _PrimaryInputState extends State<PrimaryInput> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.key,
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      maxLength: widget.maxLength,
      controller: widget.controller,
      maxLines: !widget.isBig ? 1 : 5,
      decoration: InputDecoration(
        counterText: "",
        hintText: widget.hintText,
        labelText: widget.label,
        labelStyle: widget.textStyle ??
            AppearanceKitTextTheme.build().input.copyWith(
                color: _generateColorInput(), fontSize: widget.fontSize),
        hintStyle: widget.textStyle ??
            AppearanceKitTextTheme.build().input.copyWith(
                color: _generateColorInput(), fontSize: widget.fontSize),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.inputColor == PrimaryInputColorKit.BLACK
                ? Colors.black
                : widget.enabled
                    ? Theme.of(context).colorScheme.primary
                    : Color(0xff99B3C6),
          ),
        ),
        contentPadding: widget.contentPadding,
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _generateColorInput()),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _generateColorInput()),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _generateColorInput()),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: _generateColorInput()),
                onPressed: _togglePasswordVisibility,
              )
            : widget.isSuffixIconEnabled
                ? GestureDetector(
                    child: Icon(
                      widget.suffixIcon!.icon,
                      size: 32,
                      color: widget.suffixIcon!.color,
                    ),
                    onTap: widget.onIconPressed,
                  )
                : null,
      ),
      cursorHeight: 16,
      validator: widget.validator,
      cursorColor: _generateColorInput(),
      textInputAction: TextInputAction.done,
      obscureText: widget.isPassword && _obscureText,
      onFieldSubmitted: (value) {
        if (widget.onFieldSubmitted != null) {
          widget.onFieldSubmitted!(value);
        }
      },
      style: widget.textStyle ??
          AppearanceKitTextTheme.build().input.copyWith(
              color: _generateColorInput(), fontSize: widget.fontSize),
    );
  }

  Color _generateColorInput() {
    if (widget.inputColor == PrimaryInputColorKit.BLACK) return Colors.black;
    return Theme.of(context).colorScheme.primary;
  }
}
