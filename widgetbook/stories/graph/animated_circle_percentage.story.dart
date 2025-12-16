import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:forms360_uikit/src/widgets/graph/graph_index.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: Graph,
)
Widget animatedCirclePercentageDefault(BuildContext context) {
  return Center(
    child: Graph().animatedCirclePercentage(
      percentage: 75,
      size: 200,
      color: Colors.blue,
      strokeWidth: 10,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Animated Bar',
  type: Graph,
)
Widget animatedBarDefault(BuildContext context) {
  return Center(
    child: Graph().animatedBar(
      itemName: 'Item',
      itemValue: 75,
      max: 100,
    ),
  );
}
