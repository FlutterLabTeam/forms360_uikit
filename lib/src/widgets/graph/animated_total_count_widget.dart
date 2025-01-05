import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class AnimatedTotalCountWidget extends StatelessWidget {
  final int count;
  final String label;
  final Color? color;
  final double fontSize;
  final Duration duration;

  const AnimatedTotalCountWidget({
    super.key,
    this.count = 0,
    this.label = '',
    this.color,
    this.fontSize = 92.0,
    this.duration = const Duration(seconds: 2),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: count),
      duration: duration,
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              '${value}',
              style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: color ?? context.primaryColor,
                  height: 0.9),
            ),
            SizedBox(width: 10),
            AnimatedOpacity(
              opacity: value.toDouble() == count ? 1 : 0,
              duration: duration,
              child: Container(
                width: 50,
                height: fontSize - 15,
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(bottom: 7),
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: (fontSize - 2) / 9,
                    color: color ?? context.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
