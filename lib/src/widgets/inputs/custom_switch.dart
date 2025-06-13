import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final String label;
  final bool disabled;
  final Function(bool) onTap;
  
  const CustomSwitch({
    super.key,
    required this.onTap,
    required this.value,
    required this.label,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: context.secondaryText.copyWith(
            letterSpacing: 0,
            color: context.primaryColor,
          ),
        ),
        Switch(
          value: value,
          onChanged: disabled ? null : onTap,
          activeTrackColor: disabled ? Colors.grey : context.secondaryColor,
          inactiveTrackColor: disabled ? Colors.grey : context.surfaceContainerColor,
          thumbColor: WidgetStatePropertyAll(context.surfaceColor),
          trackOutlineColor: WidgetStatePropertyAll(context.surfaceColor),
        ),
      ],
    );
  }
}
