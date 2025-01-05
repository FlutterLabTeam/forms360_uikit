import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/model/animated_bar_data.dart';
import 'package:forms360_uikit/src/widgets/graph/animated_bar.dart';
import 'package:forms360_uikit/src/widgets/graph/animated_circle_percentage.dart';
import 'package:forms360_uikit/src/widgets/graph/animated_total_count_widget.dart';

class Graph {
  Widget animatedCirclePercentage({
    required double percentage,
    required double size,
    required Color? color,
    required double strokeWidth,
  }) =>
      AnimatedCirclePercentage(
        percentage: percentage,
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      );

  Widget animatedBar({
    required AnimatedBarData data,
    required double max,
    Color? textColor,
    Color? barColor,
    Color? barTextColor,
    Color? barBackgroundColor,
  }) =>
      AnimatedBar(
        data: data,
        max: max,
        textColor: textColor,
        barColor: barColor,
        barTextColor: barTextColor,
        barBackgroundColor: barBackgroundColor,
      );

  Widget animatedTotalCountWidget({
    required int count,
    required String label,
    required double fontSize,
    required Duration duration,
    Color? color,
  }) =>
      AnimatedTotalCountWidget(
        count: count,
        label: label,
        color: color,
        fontSize: fontSize,
        duration: duration,
      );
}
