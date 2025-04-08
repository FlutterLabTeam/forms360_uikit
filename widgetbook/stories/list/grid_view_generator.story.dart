import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/list/index_list.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: UiList,
)
Widget gridViewGeneratorDefault(BuildContext context) {
  return Center(
    child: UiList().gridViewGenerator(
      list: List.generate(10, (index) => index),
      itemBuilder: (context, index) => Container(
        color: Colors.blue,
        child: Center(
          child: Text('Item $index'),
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'List Generator',
  type: UiList,
)
Widget listGeneratorDefault(BuildContext context) {
  return Center(
    child: UiList().listGenerator(
      list: List.generate(10, (index) => index),
      itemBuilder: (context, index) => Container(
        color: Colors.blue,
        child: Center(
          child: Text('Item $index'),
        ),
      ),
    ),
  );
}
