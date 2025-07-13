import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/theme/text/texts.dart';
import 'package:forms360_uikit/src/model/button_type.dart';
import 'package:forms360_uikit/src/extension/context_extension.dart';
import 'package:forms360_uikit/src/widgets/buttons/custom_button/widget/buttons.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final TextStyle? style;
  final double? fontSize;
  final double? customSize;
  final Function() onPressed;
  final Function()? longPress;
  final ButtonTypeKit buttonType;
  final SizeButtonKit sizeButton;
  final EdgeInsets? customPadding;
  final ButtonStateKit buttonState;

  const CustomButton({
    this.style,
    this.fontSize,
    this.longPress,
    this.customSize,
    this.customPadding,
    required this.title,
    required this.onPressed,
    required this.sizeButton,
    required this.buttonType,
    this.buttonState = ButtonStateKit.enabled,
  });

  @override
  State<CustomButton> createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _buttonColor(context),
      shape: RoundedRectangleBorder(
        side: _borderColor(context),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onLongPress: widget.longPress,
        borderRadius: BorderRadius.circular(8),
        onTap: widget.buttonState != ButtonStateKit.disabled
            ? () async {
                if (widget.buttonState != ButtonStateKit.disabled &&
                    !isLoading) {
                  setState(() => isLoading = true);
                  await widget.onPressed();
                  setState(() => isLoading = false);
                }
              }
            : null,
        child: Container(
          alignment: Alignment.center,
          padding: widget.customPadding ?? const EdgeInsets.all(8),
          height: widget.customSize ?? _generateSize(widget.sizeButton),
          child: isLoading
              ? ButtonLoading(
                  color: (widget.buttonType == ButtonTypeKit.primary)
                      ? context.surfaceColor
                      : context.primaryLightColor,
                )
              : Text(
                  widget.title,
                  style: widget.style ?? _textButtonColor(context),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }

  BorderSide _borderColor(BuildContext context) {
    final type = widget.buttonType;
    final state = widget.buttonState;

    Color col = context.primaryLightColor;

    if (type == ButtonTypeKit.tertiary) col = context.primaryLightColor;
    if (type == ButtonTypeKit.primary || type == ButtonTypeKit.fourth) {
      return BorderSide.none;
    }
    if (state == ButtonStateKit.disabled) col = context.onSurfaceColor;

    return BorderSide(width: 1.5, color: col);
  }

  TextStyle _textButtonColor(BuildContext context) {
    Color textColor = context.surfaceColor;

    if (widget.buttonType == ButtonTypeKit.secondary) {
      textColor = context.primaryLightColor;
    }
    if (widget.buttonState == ButtonStateKit.disabled) {
      textColor = context.onSurfaceColor;
    }

    return AppearanceKitTextTheme.build().button.copyWith(
          color: textColor,
          fontSize: widget.fontSize ?? 25,
        );
  }

  Color _buttonColor(BuildContext context) {
    switch (widget.buttonType) {
      case ButtonTypeKit.primary:
        return context.primaryLightColor;
      case ButtonTypeKit.secondary:
        return context.surfaceColor;
      case ButtonTypeKit.tertiary:
        return Colors.transparent;
      case ButtonTypeKit.fourth:
        return context.primaryLightColor.withOpacity(0.4);
    }
  }

  double _generateSize(SizeButtonKit size) {
    switch (size) {
      case SizeButtonKit.big:
        return 60;
      case SizeButtonKit.small:
        return 40;
    }
  }
}
