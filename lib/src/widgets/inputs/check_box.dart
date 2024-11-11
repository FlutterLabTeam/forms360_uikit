import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/extension/context_extension.dart';

class CheckBox extends StatelessWidget {
  final bool state;
  final Function() onTap;

  const CheckBox({super.key, required this.state, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: CircleBorder(),
      hoverColor: Colors.transparent,
      highlightColor: Colors.black12,
      splashColor: Colors.grey.shade50,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Material(
          child: Padding(
            padding: EdgeInsets.all(3),
            child: Icon(Icons.check, color: context.surfaceContainerColor),
          ),
          color: state ? context.onPrimaryColor : context.surfaceContainerColor,
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
