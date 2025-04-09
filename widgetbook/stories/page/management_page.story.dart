import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/page/index_page.dart';
import 'package:forms360_uikit/src/model/menu_item_type_type.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: UiPage,
)
Widget managementPageDefault(BuildContext context) {
  return Center(
    child: UiPage().managementPage(
      endContent: const Text('End Content'),
      startContent: const Text('Start Content'),
      profileLetter: 'A',
      onProfileTap: () {},
      selectedMenuItem: MenuItemTypeKit.DASHBOARD,
      onMenuItemSelected: (item) {},
    ),
  );
}
