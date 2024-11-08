import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/theme/text/texts.dart';
import 'package:forms360_uikit/src/model/input_types.dart';

class PrimaryInput extends StatefulWidget {
  const PrimaryInput({
    super.key,
    this.onChanged,
    this.validator,
    this.controller,
    required this.isBig,
    required this.label,
    required this.enabled,
    required this.hintText,
    required this.isPassword,
    required this.inputColor,
  });

  final bool isBig;
  final String label;
  final String hintText;
  final bool isPassword;
  final PrimaryInputColorKit inputColor;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool enabled;

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
      controller: widget.controller,
      maxLines: !widget.isBig ? 1 : 5,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.label,
        labelStyle: AppearanceKitTextTheme.build()
            .input
            .copyWith(color: _generateColorInput()),
        hintStyle: AppearanceKitTextTheme.build()
            .input
            .copyWith(color: _generateColorInput()),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.inputColor == PrimaryInputColorKit.BLACK
                ? Colors.black
                : widget.enabled
                    ? Theme.of(context).colorScheme.primary
                    : Color(0xff99B3C6),
          ),
        ),
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
            : null,
      ),
      cursorHeight: 16,
      validator: widget.validator,
      cursorColor: _generateColorInput(),
      textInputAction: TextInputAction.done,
      obscureText: widget.isPassword && _obscureText,
      style: AppearanceKitTextTheme.build()
          .input
          .copyWith(color: _generateColorInput()),
    );
  }

  Color _generateColorInput() {
    if (widget.inputColor == PrimaryInputColorKit.BLACK) return Colors.black;
    return Theme.of(context).colorScheme.primary;
  }
}
