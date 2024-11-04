import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/util/texts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forms360_uikit/src/model/button_type.dart';
import 'package:forms360_uikit/src/widgets/async_value_widget.dart';
import 'package:forms360_uikit/src/widgets/buttons/custom_button/widget/buttons.dart';
import 'package:forms360_uikit/src/widgets/buttons/custom_button/provider/custom_button_controller.dart';

class UiButton {
  Widget button({
    required String title,
    SizeButtonKit? sizeButton,
    ButtonTypeKit? buttonType,
    ButtonStateKit? buttonState,
    required Future<void> Function() onPressed,
  }) =>
      _CustomButton(
        title: title,
        onPressed: onPressed,
        buttonType: buttonType,
        sizeButton: sizeButton,
        buttonState: buttonState,
      );
}

class _CustomButton extends ConsumerWidget {
  final String title;
  final ButtonTypeKit? buttonType;
  final SizeButtonKit? sizeButton;
  final ButtonStateKit? buttonState;
  final Future<void> Function() onPressed;

  const _CustomButton({
    required this.title,
    required this.onPressed,
    this.sizeButton = SizeButtonKit.big,
    this.buttonType = ButtonTypeKit.primary,
    this.buttonState = ButtonStateKit.enabled,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(customButtonControllerProvider.notifier);
    final buttonProvider = ref.watch(customButtonControllerProvider);

    return InkWell(
      onTap: () {
        if (buttonState != ButtonStateKit.disabled && !buttonProvider.isLoading) {
          provider.onTap(onPressed);
        }
      },
      child: Container(
        height: _generateSize(sizeButton!),
        decoration: BoxDecoration(
          color: _buttonColor(context),
          border: _borderColor(context),
          borderRadius: BorderRadius.circular(8),
        ),
        child: AsyncValueWidget(
          loadingWidget: ButtonLoading(),
          value: buttonProvider,
          data: (data) => Center(
            child: Text(title, style: _textButtonColor(context)),
          ),
        ),
      ),
    );
  }

  BoxBorder? _borderColor(BuildContext context) {
    Color color = Theme.of(context).colorScheme.primary;

    if (buttonType == ButtonTypeKit.primary) return null;

    if (buttonType == ButtonTypeKit.tertiary) {
      color = Colors.white;
    }
    if (buttonState == ButtonStateKit.disabled) {
      color = Color(0xFFC9DEEE);
    }

    return Border.all(width: 2, color: color);
  }

  TextStyle _textButtonColor(BuildContext context) {
    Color textColor = Colors.white;

    if (buttonType == ButtonTypeKit.secondary) {
      textColor = Theme.of(context).colorScheme.primary;
    }
    if (buttonState == ButtonStateKit.disabled) {
      textColor = Theme.of(context).colorScheme.primary;
    }

    return FormsTextStyle().button.copyWith(color: textColor);
  }

  Color _buttonColor(BuildContext context) {
    switch (buttonType!) {
      case ButtonTypeKit.primary:
        return Theme.of(context).colorScheme.primary;
      case ButtonTypeKit.secondary:
        return Colors.white;
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
