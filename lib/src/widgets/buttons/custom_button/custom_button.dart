import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/extension/context_extension.dart';
import 'package:forms360_uikit/src/theme/text/texts.dart';
import 'package:forms360_uikit/src/model/button_type.dart';
import 'package:forms360_uikit/src/widgets/buttons/custom_button/widget/buttons.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final Function() onPressed;
  final ButtonTypeKit buttonType;
  final SizeButtonKit sizeButton;
  final ButtonStateKit buttonState;

  const CustomButton({
    required this.title,
    required this.onPressed,
    required this.sizeButton,
    required this.buttonType,
    required this.buttonState,
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
        borderRadius: BorderRadius.circular(8),
        onTap: () async {
          if (widget.buttonState != ButtonStateKit.disabled && !isLoading) {
            setState(() => isLoading = true);
            await widget.onPressed();
            setState(() => isLoading = false);
          }
        },
        child: SizedBox(
          height: _generateSize(widget.sizeButton),
          child: isLoading
              ? Center(child: ButtonLoading())
              : Center(
                  child: Text(widget.title, style: _textButtonColor(context)),
                ),
        ),
      ),
    );
  }

  BorderSide _borderColor(BuildContext context) {
    Color col = Theme.of(context).colorScheme.primary;
    if (widget.buttonType == ButtonTypeKit.tertiary) col = context.surfaceColor;
    if (widget.buttonType == ButtonTypeKit.primary) return BorderSide.none;
    if (widget.buttonState == ButtonStateKit.disabled) {
      col = context.onSurfaceColor;
    }

    return BorderSide(width: 2, color: col);
  }

  TextStyle _textButtonColor(BuildContext context) {
    Color textColor = context.surfaceColor;

    if (widget.buttonType == ButtonTypeKit.secondary) {
      textColor = Theme.of(context).colorScheme.primary;
    }
    if (widget.buttonState == ButtonStateKit.disabled) {
      textColor = context.onSurfaceColor;
    }

    return AppearanceKitTextTheme.build().button.copyWith(color: textColor);
  }

  Color _buttonColor(BuildContext context) {
    switch (widget.buttonType) {
      case ButtonTypeKit.primary:
        return Theme.of(context).colorScheme.primary;
      case ButtonTypeKit.secondary:
        return context.surfaceColor;
      case ButtonTypeKit.tertiary:
        return Colors.transparent;
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
