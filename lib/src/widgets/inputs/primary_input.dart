import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:forms360_uikit/src/theme/text/texts.dart';
import 'package:forms360_uikit/src/model/input_types.dart';

class PrimaryInput extends StatefulWidget {
  const PrimaryInput({
    super.key,
    this.label,
    this.onChanged,
    this.maxLength,
    this.validator,
    this.textStyle,
    this.controller,
    this.suffixIcon,
    this.initialValue,
    this.keyboardType,
    this.onIconPressed,
    required this.isBig,
    this.contentPadding,
    this.inputFormatters,
    required this.enabled,
    this.onFieldSubmitted,
    this.onFocusChanged,
    required this.hintText,
    required this.isPassword,
    this.isSuffixIconEnabled = false,
    this.showCounter = false,
    PrimaryInputColorKit? inputColor,
    this.prefixWidget,
    this.showPrefixWhenUnfocused = true,
    this.onTap,
    this.onlyRead = false,
  }) : inputColor = inputColor ?? PrimaryInputColorKit.BLUE;

  final bool isBig;
  final bool enabled;
  final String? label;
  final int? maxLength;
  final String hintText;
  final bool isPassword;
  final Icon? suffixIcon;
  final TextStyle? textStyle;
  final String? initialValue;
  final bool isSuffixIconEnabled;
  final EdgeInsets? contentPadding;
  final TextInputType? keyboardType;
  final void Function()? onIconPressed;
  final PrimaryInputColorKit inputColor;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String?)? onFieldSubmitted;
  final void Function(String)? onFocusChanged;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixWidget;
  final bool showCounter;
  final bool showPrefixWhenUnfocused;
  final VoidCallback? onTap;
  final bool onlyRead;
  @override
  _PrimaryInputState createState() => _PrimaryInputState();
}

class _PrimaryInputState extends State<PrimaryInput> {
  Iterable<String>? autofillHints;
  bool _obscureText = true;
  late FocusNode _focusNode;
  String _value = "";
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
    _focusNode = FocusNode();

    if (widget.keyboardType == TextInputType.emailAddress) {
      autofillHints = [AutofillHints.username];
    }

    if (widget.isPassword) {
      autofillHints = [AutofillHints.password];
    }

    SchedulerBinding.instance.addPostFrameCallback(
      (_) async {
        _focusNode.addListener(() {
          setState(() {
            _hasFocus = _focusNode.hasFocus;
          });
          if (!_focusNode.hasFocus) widget.onFocusChanged?.call(_value);
        });
      },
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _shouldShowPrefix() {
    if (widget.prefixWidget == null) return false;
    
    // Siempre mostrar el prefixWidget si está definido
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.key,
      focusNode: _focusNode,
      enabled: widget.onlyRead ? true : widget.enabled,
      readOnly: widget.onlyRead,
      onTap: widget.onTap,
      onChanged: (value) {
        _value = value;
        widget.onChanged?.call(value);
      },
      maxLength: widget.maxLength,
      controller: widget.controller,
      maxLines: !widget.isBig ? 1 : 6,
      initialValue: widget.initialValue,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      onFieldSubmitted: widget.onFieldSubmitted,
      autofillHints: widget.keyboardType == TextInputType.emailAddress
          ? [AutofillHints.username]
          : widget.isPassword
              ? [AutofillHints.password]
              : null,
      decoration: InputDecoration(
        
        counterText: widget.showCounter ? null : "",
        prefix: _shouldShowPrefix() ? widget.prefixWidget : null,
        hintText: widget.hintText,
        labelText: widget.label,
        labelStyle: widget.textStyle ??
            AppearanceKitTextTheme.build()
                .input
                .copyWith(color: _getEnabledColor(), fontSize: 20),
        fillColor: widget.inputColor == PrimaryInputColorKit.TRANSPARENT
            ? Colors.transparent
            : null,
        hintStyle: widget.textStyle ??
            AppearanceKitTextTheme.build()
                .input
                .copyWith(color: _getEnabledColor(), fontSize: 20),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.inputColor == PrimaryInputColorKit.BLACK
                ? Colors.black
                : (widget.onlyRead || widget.enabled)
                    ? Theme.of(context).colorScheme.primary
                    : Color(0xff99B3C6),
          ),
        ),
        contentPadding: widget.contentPadding ??
            EdgeInsets.only(top: 18, bottom: 22, left: 19.21, right: 19.21),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _getEnabledColor()),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _getEnabledColor()),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _getEnabledColor()),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: _getEnabledColor(),
                ),
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
      validator: widget.validator,
      cursorColor: _getEnabledColor(),
      textInputAction: TextInputAction.done,
      obscureText: widget.isPassword ? _obscureText : false,
      style: widget.textStyle ??
          AppearanceKitTextTheme.build()
              .input
              .copyWith(color: _getEnabledColor(), fontSize: 20),
    );
  }

  Color _getEnabledColor() {
    if (widget.onlyRead) return _generateColorInput();
    return widget.enabled ? _generateColorInput() : Colors.grey;
  }

  Color _generateColorInput() {
    if (widget.inputColor == PrimaryInputColorKit.BLACK) return Colors.black;
    if (widget.inputColor == PrimaryInputColorKit.WHITE) return Colors.white;
    if (widget.inputColor == PrimaryInputColorKit.TRANSPARENT)
      return Colors.white;
    return Theme.of(context).colorScheme.primary;
  }
}
