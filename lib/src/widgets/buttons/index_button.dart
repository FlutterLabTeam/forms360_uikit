import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/buttons/date_button/date_button.dart';
import 'package:forms360_uikit/src/widgets/buttons/text_button/text_button.dart';
import 'package:forms360_uikit/src/widgets/buttons/custom_button/dotted_button.dart';
import 'package:forms360_uikit/src/widgets/buttons/custom_button/custom_button.dart';
import 'package:forms360_uikit/src/widgets/buttons/select_button/select_button.dart';
import 'package:forms360_uikit/src/widgets/buttons/circular_button/circular_button.dart';

class UiButton {
  Widget button({
    TextStyle? style,
    Function()? longPress,
    required String title,
    required Function() onPressed,
    SizeButtonKit sizeButton = SizeButtonKit.big,
    ButtonTypeKit buttonType = ButtonTypeKit.primary,
    ButtonStateKit buttonState = ButtonStateKit.enabled,
    Color? backgroundColor,
  }) =>
      CustomButton(
        title: title,
        style: style,
        longPress: longPress,
        onPressed: onPressed,
        buttonType: buttonType,
        sizeButton: sizeButton,
        buttonState: buttonState,
        backgroundColor: backgroundColor,
      );

  Widget selectButton({
    required String label,
    required bool isSelect,
    required Function() onTap,
  }) =>
      SelectButton(onTap: onTap, label: label, isSelect: isSelect);

  Widget circularButton({
    Color? color,
    double? elevation,
    required IconData icon,
    required Function() onTap,
  }) =>
      CircularButton(
        icon: icon,
        onTap: onTap,
        color: color,
        elevation: elevation,
      );

  Widget textButton({
    required String text,
    final TextStyle? style,
    required Function() onTap,
  }) =>
      TextButton(onTap: onTap, text: text, style: style);

  Widget dateButton({
    final double width = 200,
    required Function(DateTime?) onTap,
    required TextEditingController dateController,
    required String label,
    final DateTime? selectedDate,
  }) =>
      DateButton(
        onTap: onTap,
        label: label,
        dateController: dateController,
        selectedDate: selectedDate,
        width: width,
      );

  Widget dottedButton({
    required String label,
    required Function() onTap,
    double? width,
    double? height,
    double? labelSize,
    Color? backgroundColor,
    Color? labelColor,
    Color? borderColor,
    EdgeInsetsGeometry? padding,
    IconData? icon,
  }) =>
      DottedButton(
        label: label,
        onTap: onTap,
        width: width,
        height: height,
        labelSize: labelSize,
        backgroundColor: backgroundColor,
        labelColor: labelColor,
        padding: padding,
        icon: icon,
        borderColor: borderColor,
      );
}
