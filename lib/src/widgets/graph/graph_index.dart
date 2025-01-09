import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/widgets/graph/animated_bar.dart';
import 'package:forms360_uikit/src/widgets/graph/animated_bar_graph_list_view.dart';
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
    required String itemName,
    required double itemValue,
    required double max,
    Color? textColor,
    Color? barColor,
    Color? barTextColor,
    Color? barBackgroundColor,
  }) =>
      AnimatedBar(
        itemName: itemName,
        itemValue: itemValue,
        max: max,
        textColor: textColor,
        barColor: barColor,
        barTextColor: barTextColor,
        barBackgroundColor: barBackgroundColor,
      );

  Widget animatedTotalCountWidget({
    required int count,
    required String label,
    double fontSize = 92.0,
    Duration duration = const Duration(seconds: 2),
    Color? color,
  }) =>
      AnimatedTotalCountWidget(
        count: count,
        label: label,
        color: color,
        fontSize: fontSize,
        duration: duration,
      );

  Widget animatedBarGraphListView({
    required Map<String, double> data,
    Color? textColor,
    Color? barColor,
    Color? barTextColor,
    Color? barBackgroundColor,
    bool isSearchable = false,
    String searchLabel = '',
  }) =>
      AnimatedBarGraphListView(
        data: data,
        textColor: textColor,
        barColor: barColor,
        barTextColor: barTextColor,
        barBackgroundColor: barBackgroundColor,
        isSearchable: isSearchable,
        searchLabel: searchLabel,
      );
}
