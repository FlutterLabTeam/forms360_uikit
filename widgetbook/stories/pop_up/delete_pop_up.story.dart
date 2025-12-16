import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:forms360_uikit/src/widgets/pop_up/widget_index_pop_up.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: WidgetIndexPopUp,
)
Widget deletePopUpDefault(BuildContext context) {
  return Center(
    child: WidgetIndexPopUp().deletePopUp(
      title: 'Delete Item',
      description: 'Are you sure you want to delete this item?',
      onTap: () {},
    ),
  );
}
