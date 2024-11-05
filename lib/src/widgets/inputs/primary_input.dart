import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/util/texts.dart';

enum PrimaryInputColor {
  BLACK,
  BLUE,
}

class PrimaryInput extends StatefulWidget {
  const PrimaryInput({
    super.key,
    this.onChanged,
    this.validator,
    this.controller,
    required this.label,
    this.enabled = true,
    required this.hintText,
    required this.isPassword,
    this.inputColor = PrimaryInputColor.BLACK,
  });

  final String label;
  final String hintText;
  final bool isPassword;
  final PrimaryInputColor inputColor;
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
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.label,
        labelStyle: FormsTextStyle().primary.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: widget.inputColor == PrimaryInputColor.BLACK
                  ? Colors.black
                  : Theme.of(context).colorScheme.primary,
            ),
        hintStyle: FormsTextStyle().primary.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: widget.inputColor == PrimaryInputColor.BLACK
                  ? Colors.black
                  : Theme.of(context).colorScheme.primary,
            ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: widget.inputColor == PrimaryInputColor.BLACK
                  ? Colors.black
                  : widget.enabled
                      ? Theme.of(context).colorScheme.primary
                      : Color(0xff99B3C6)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.inputColor == PrimaryInputColor.BLACK
                ? Colors.black
                : Theme.of(context).colorScheme.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.inputColor == PrimaryInputColor.BLACK
                ? Colors.black
                : Theme.of(context).colorScheme.primary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.inputColor == PrimaryInputColor.BLACK
                ? Colors.black
                : Theme.of(context).colorScheme.primary,
          ),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: widget.inputColor == PrimaryInputColor.BLACK
                      ? Colors.black
                      : Theme.of(context).colorScheme.primary,
                ),
                onPressed: _togglePasswordVisibility,
              )
            : null,
      ),
      cursorHeight: 16,
      style: FormsTextStyle().primary.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: widget.inputColor == PrimaryInputColor.BLACK
                ? Colors.black
                : Theme.of(context).colorScheme.primary,
          ),
      cursorColor: widget.inputColor == PrimaryInputColor.BLACK
          ? Colors.black
          : Theme.of(context).colorScheme.primary,
      textInputAction: TextInputAction.done,
      obscureText: widget.isPassword && _obscureText,
      validator: widget.validator,
    );
  }
}
