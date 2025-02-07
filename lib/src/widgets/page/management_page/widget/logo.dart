import 'package:flutter/material.dart';

enum LogoColor { PRIMARY, WHITE }

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
      default:
        return 'assets/brand/logo.png';
    }
  }
}
