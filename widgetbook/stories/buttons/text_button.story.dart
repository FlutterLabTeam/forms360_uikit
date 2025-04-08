import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/buttons/index_button.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: UiButton,
)
Widget textButtonDefault(BuildContext context) {
  return Center(
    child: UiButton().textButton(
      text: 'Text Button',
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Style',
  type: UiButton,
)
Widget textButtonWithStyle(BuildContext context) {
  return Center(
    child: UiButton().textButton(
      text: 'Text Button with Style',
      style: context.primaryText.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'Disabled',
  type: UiButton,
)
Widget textButtonDisabled(BuildContext context) {
  return Center(
    child: UiButton().textButton(
      text: 'Disabled Text Button',
      style: context.primaryText.copyWith(
        color: Colors.grey,
      ),
      onTap: () {},
    ),
  );
}
