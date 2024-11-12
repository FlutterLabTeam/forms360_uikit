import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/extension/context_extension.dart';

class SelectButton extends StatelessWidget {
  final bool isSelect;
  final String label;
  final Function() onTap;

  const SelectButton({
    super.key,
    required this.onTap,
    required this.label,
    required this.isSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _backgroundColor(context),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(),
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Text(
            label,
            textAlign: TextAlign.start,
            style: context.secondaryText.copyWith(color: _textColor(context)),
          ),
        ),
      ),
    );
  }

  _backgroundColor(BuildContext context) {
    if (isSelect) return context.primaryColor;
    return context.surfaceContainerColor;
  }

  _textColor(BuildContext context) {
    if (isSelect) return context.surfaceContainerColor;
    return context.primaryColor;
  }
}
