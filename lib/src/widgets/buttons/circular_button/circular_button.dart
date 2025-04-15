import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/theme/colors/color_palette.dart';

class CircularButton extends StatelessWidget {
  final Color? color;
  final IconData icon;
  final Function() onTap;
  final double? elevation;

  const CircularButton({
    super.key,
    this.color,
    this.elevation,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? 7,
      shape: const CircleBorder(),
      color: color ?? ColorPalette.primaryLight,
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
