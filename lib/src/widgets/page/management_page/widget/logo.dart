import 'package:flutter/material.dart';

enum LogoColor { PRIMARY, WHITE }

class LogoForms extends StatelessWidget {
  const LogoForms({super.key, this.color = LogoColor.PRIMARY});

  final LogoColor color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      color == LogoColor.PRIMARY
          ? 'assets/brand/logo.png'
          : 'assets/brand/logo_white.png',
    );
  }
}
