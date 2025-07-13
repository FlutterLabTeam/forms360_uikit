import 'package:flutter/material.dart';

class ButtonLoading extends StatelessWidget {
  const ButtonLoading({super.key, this.color = Colors.white});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 12,
      height: 12,
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(
          Colors.white,
        ),
        backgroundColor: color,
      ),
    );
  }
}
