import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/extension/context_extension.dart';

class CheckBox extends StatelessWidget {
  final bool state;
  final Function(bool) onTap;
  final bool enabled;

  const CheckBox({super.key, required this.state, required this.onTap, required this.enabled});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !enabled ? null :  () => onTap(!state),
      customBorder: CircleBorder(),
      hoverColor: Colors.transparent,
      highlightColor: Colors.black12,
      splashColor: Colors.grey.shade50,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Material(
          child: Icon(
            Icons.check,
            size: 17,
            color: context.surfaceContainerColor,
          ),
          borderRadius: BorderRadius.circular(4),
          color: state ? context.primaryColor : context.surfaceContainerColor,
        ),
      ),
    );
  }
}
