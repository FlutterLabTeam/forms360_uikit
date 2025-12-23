import 'package:flutter/material.dart';

enum LogoColor { PRIMARY, WHITE, WEB }

class LogoForms extends StatelessWidget {
  const LogoForms({super.key, this.color = LogoColor.PRIMARY});

  final LogoColor color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(_getPath(color));
  }

  String _getPath(LogoColor lColor) {
    switch (lColor) {
      case LogoColor.WHITE:
        return 'assets/brand/raios360_white.png';
      case LogoColor.WEB:
        return 'assets/icons_web/formIcon.png';
      default:
        return 'assets/brand/logo.png';
    }
  }
}
