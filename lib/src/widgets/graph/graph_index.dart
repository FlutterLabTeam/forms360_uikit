import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/model/animated_bar_data.dart';

class Graph {
  Widget animatedCirclePercentage({
    required double percentage,
    required double size,
    required Color? color,
    required double strokeWidth,
  }) =>
      animatedCirclePercentage(
        percentage: percentage,
        size: size,
        color: color,
        strokeWidth: strokeWidth,
      );

  Widget animatedBarData({
    required String itemName,
    double value = 0,
  }) =>
      animatedBarData(
        itemName: itemName,
        value: value,
      );

  Widget animatedBar({
    required AnimatedBarData data,
    required double max,
    Color? textColor,
    Color? barColor,
    Color? barTextColor,
    Color? barBackgroundColor,
  }) =>
      animatedBar(
        data: data,
        max: max,
        textColor: textColor,
        barColor: barColor,
        barTextColor: barTextColor,
        barBackgroundColor: barBackgroundColor,
      );
}
