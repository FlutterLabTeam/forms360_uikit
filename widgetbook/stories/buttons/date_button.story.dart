import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/buttons/index_button.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: UiButton,
)
Widget dateButtonDefault(BuildContext context) {
  return Center(
    child: UiButton().dateButton(
      label: 'Select Date',
      dateController: TextEditingController(),
      onTap: (date) {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Selected Date',
  type: UiButton,
)
Widget dateButtonWithSelectedDate(BuildContext context) {
  return Center(
    child: UiButton().dateButton(
      label: 'Select Date',
      dateController: TextEditingController(),
      onTap: (date) {},
      selectedDate: DateTime.now(),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Custom Width',
  type: UiButton,
)
Widget dateButtonCustomWidth(BuildContext context) {
  return Center(
    child: UiButton().dateButton(
      label: 'Select Date',
      dateController: TextEditingController(),
      onTap: (date) {},
      width: 300,
    ),
  );
}
