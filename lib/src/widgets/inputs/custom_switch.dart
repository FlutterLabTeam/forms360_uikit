import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final String label;
  final bool disabled;
  final Function(bool) onTap;
  final MainAxisAlignment? mainAxisAlignment;
  
  const CustomSwitch({
    super.key,
    required this.onTap,
    required this.value,
    required this.label,
    this.disabled = false,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        SizedBox(
          child: Text(
            label,
            maxLines: 5,
            style: context.secondaryText.copyWith(
              letterSpacing: 0,
              color: context.primaryColor,
            ),
          ),
        ),
        SizedBox(width: 10),
        Switch(
          value: value,
          onChanged: disabled ? null : onTap,
          thumbColor: WidgetStatePropertyAll(context.surfaceColor),
          trackOutlineColor: WidgetStatePropertyAll(context.surfaceColor),
          activeTrackColor: disabled ? Colors.grey : context.secondaryColor,
          inactiveTrackColor: disabled ? Colors.grey : context.surfaceContainerColor,
        ),
      ],
    );
  }
}
