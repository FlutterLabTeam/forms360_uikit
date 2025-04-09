import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:forms360_uikit/src/widgets/buttons/index_button.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: UiButton,
)
Widget selectButtonDefault(BuildContext context) {
  return Center(
    child: UiButton().selectButton(
      label: 'Select Option',
      isSelect: false,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'Selected',
  type: UiButton,
)
Widget selectButtonSelected(BuildContext context) {
  return Center(
    child: UiButton().selectButton(
      label: 'Selected Option',
      isSelect: true,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Long Label',
  type: UiButton,
)
Widget selectButtonLongLabel(BuildContext context) {
  return Center(
    child: UiButton().selectButton(
      label: 'This is a very long option that should wrap',
      isSelect: false,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'Custom Width',
  type: UiButton,
)
Widget selectButtonCustomWidth(BuildContext context) {
  return Center(
    child: UiButton().selectButton(
      label: 'Select Option',
      onTap: () {},
      isSelect: false,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Disabled',
  type: UiButton,
)
Widget selectButtonDisabled(BuildContext context) {
  return Center(
    child: UiButton().selectButton(
      label: 'Select Option',
      onTap: () {},
      isSelect: false,
    ),
  );
}
