import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/buttons/index_button.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: UiButton,
)
Widget dottedButtonDefault(BuildContext context) {
  return Center(
    child: UiButton().dottedButton(
      label: 'Add Item',
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'Custom Icon',
  type: UiButton,
)
Widget dottedButtonCustomIcon(BuildContext context) {
  return Center(
    child: UiButton().dottedButton(
      label: 'Upload File',
      icon: Icons.upload_file,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'Custom Size',
  type: UiButton,
)
Widget dottedButtonCustomSize(BuildContext context) {
  return Center(
    child: UiButton().dottedButton(
      label: 'Add Item',
      width: 200,
      height: 50,
      labelSize: 16,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'Custom Colors',
  type: UiButton,
)
Widget dottedButtonCustomColors(BuildContext context) {
  return Center(
    child: UiButton().dottedButton(
      label: 'Add Item',
      backgroundColor: Colors.grey[100],
      labelColor: Colors.blue,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'Custom Padding',
  type: UiButton,
)
Widget dottedButtonCustomPadding(BuildContext context) {
  return Center(
    child: UiButton().dottedButton(
      label: 'Add Item',
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      onTap: () {},
    ),
  );
}
