import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class AnimatedCirclePercentage extends StatelessWidget {
  final double percentage;
  final Color? color;
  final double strokeWidth;
  final double size;

  const AnimatedCirclePercentage({
    super.key,
    required this.percentage,
    this.color,
    this.strokeWidth = 7.0,
    this.size = 100,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: percentage),
      duration: Duration(seconds: 1),
      builder: (context, value, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: Size(size, size), // You can adjust the size as needed
              painter: CirclePercentagePainter(
                percentage: value,
                color: color ?? context.primaryColor,
                strokeWidth: strokeWidth,
              ),
            ),
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Text(
                  '${value.toInt()}',
                  style: TextStyle(
                    fontSize: size / 2.6,
                    fontWeight: FontWeight.w900,
                    color: color ?? context.primaryColor,
                  ),
                ),
                Positioned(
                  top: -size /
                      40, // Adjust this value to position the percent sign correctly
                  right: -size /
                      11, // Adjust this value to position the percent sign correctly
                  child: Text(
                    '%',
                    style: TextStyle(
                      fontSize: size / 6,
                      fontWeight: FontWeight.bold,
                      color: color ?? context.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class CirclePercentagePainter extends CustomPainter {
  final double percentage;
  final Color color;
  final double strokeWidth;

  CirclePercentagePainter({
    required this.percentage,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double radius = (size.width / 2) - (strokeWidth / 2);
    Offset center = Offset(size.width / 2, size.height / 2);
    double sweepAngle = (percentage / 100) * 2 * 3.141592653589793;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.141592653589793 / 2, // Start angle (top of the circle)
      sweepAngle, // Sweep angle
      false, // Use center
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
