import 'package:flutter/material.dart';

class AnimatedBar extends StatelessWidget {
  final String itemName;
  final double itemValue;
  final double max;
  final Color? textColor;
  final Color? barColor;
  final Color? barTextColor;
  final Color? barBackgroundColor;

  const AnimatedBar({
    super.key,
    required this.itemName,
    required this.itemValue,
    required this.max,
    this.textColor,
    this.barColor,
    this.barTextColor,
    this.barBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double maxWidth =
            constraints.maxWidth * 0.8; // Adjust this value as needed

        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: constraints.maxWidth * 0.2,
              child: Text(
                itemName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor ?? Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: itemValue),
                duration: Duration(seconds: 1),
                builder: (context, value, child) {
                  double barWidth =
                      itemValue != 0 ? maxWidth * (value / max) : 0;
                  return Stack(
                    children: [
                      Container(
                        height: 30, // Increased height for a thicker bar
                        decoration: BoxDecoration(
                          color: barBackgroundColor ?? null,
                          borderRadius:
                              BorderRadius.circular(4), // Rounded corners
                        ),
                      ),
                      Container(
                        height: 30, // Increased height for a thicker bar
                        width: barWidth,
                        decoration: BoxDecoration(
                          color: barColor ?? Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      Container(
                        height: 30,
                        padding: EdgeInsets.only(left: 8.0, top: 6),
                        width: constraints.maxWidth,
                        child: Text(
                          textAlign: TextAlign.start,
                          '${value.toInt()}',
                          style: TextStyle(
                            color: barTextColor ?? Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
