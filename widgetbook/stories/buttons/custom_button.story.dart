import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/buttons/index_button.dart';

@widgetbook.UseCase(
  name: 'Primary - Big',
  type: UiButton,
)
Widget customButtonPrimaryBig(BuildContext context) {
  return Center(
    child: UiButton().button(
      title: 'Primary Button',
      onPressed: () {},
      buttonType: ButtonTypeKit.primary,
      sizeButton: SizeButtonKit.big,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Primary - Small',
  type: UiButton,
)
Widget customButtonPrimarySmall(BuildContext context) {
  return Center(
    child: UiButton().button(
      title: 'Primary Button',
      onPressed: () {},
      buttonType: ButtonTypeKit.primary,
      sizeButton: SizeButtonKit.small,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Secondary - Big',
  type: UiButton,
)
Widget customButtonSecondaryBig(BuildContext context) {
  return Center(
    child: UiButton().button(
      title: 'Secondary Button',
      onPressed: () {},
      buttonType: ButtonTypeKit.secondary,
      sizeButton: SizeButtonKit.big,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Secondary - Small',
  type: UiButton,
)
Widget customButtonSecondarySmall(BuildContext context) {
  return Center(
    child: UiButton().button(
      title: 'Secondary Button',
      onPressed: () {},
      buttonType: ButtonTypeKit.secondary,
      sizeButton: SizeButtonKit.small,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Disabled',
  type: UiButton,
)
Widget customButtonDisabled(BuildContext context) {
  return Center(
    child: UiButton().button(
      title: 'Disabled Button',
      onPressed: () {},
      buttonState: ButtonStateKit.disabled,
    ),
  );
}
