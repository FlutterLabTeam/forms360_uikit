import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class CircularButton extends StatelessWidget {
  final IconData icon;
  final Function() onTap;
  final double? elevation;

  const CircularButton({
    super.key,
    this.elevation,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? 7,
      shape: const CircleBorder(),
      color: context.primaryColor,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Icon(icon, color: Colors.white),
        ),
      ),
    );
  }
}
