import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/buttons/custom_button/custom_button.dart';
import 'package:forms360_uikit/src/widgets/buttons/select_button/select_button.dart';

class UiButton {
  Widget button({
    required String title,
    required Function() onPressed,
    SizeButtonKit sizeButton = SizeButtonKit.big,
    ButtonTypeKit buttonType = ButtonTypeKit.primary,
    ButtonStateKit buttonState = ButtonStateKit.enabled,
  }) =>
      CustomButton(
        title: title,
        onPressed: onPressed,
        buttonType: buttonType,
        sizeButton: sizeButton,
        buttonState: buttonState,
      );

  Widget selectButton({
    required String label,
    required bool isSelect,
    required Function() onTap,
  }) => SelectButton(onTap: onTap, label: label, isSelect: isSelect);
}
