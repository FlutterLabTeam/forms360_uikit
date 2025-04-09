import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/menu/menu_icon.dart';
import 'package:forms360_uikit/src/model/menu_item_type_type.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: MenuIcon,
)
Widget menuIconDefault(BuildContext context) {
  return const Center(
    child: MenuIcon(
      type: MenuItemTypeKit.DASHBOARD,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Selected',
  type: MenuIcon,
)
Widget menuIconSelected(BuildContext context) {
  return const Center(
    child: MenuIcon(
      type: MenuItemTypeKit.DASHBOARD,
      isSelected: true,
    ),
  );
}
