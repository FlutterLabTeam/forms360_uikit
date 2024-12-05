import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/src/model/menu_item_type_type.dart';
import 'package:forms360_uikit/src/widgets/page/management_page/management_page.dart';
import 'package:forms360_uikit/src/widgets/page/standard_page/standard_page.dart';

class UiPage {
  Widget backgroundPage({
    required Widget child,
    required String image,
    String labelPage = "",
  }) =>
      BackgroundPage(child: child, image: image, labelPage: labelPage);

  Widget managementPage({
    double spacing = 36,
    required Widget endContent,
    required Widget startContent,
    required MenuItemTypeKit selectedMenuItem,
    String assetPath = 'assets/images/clients/users_background.png',
    MainAxisAlignment rowMainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment rowCrossAxisAlignment = CrossAxisAlignment.start,
  }) =>
      ManagementPage(
        spacing: spacing,
        assetPath: assetPath,
        endContent: endContent,
        startContent: startContent,
        selectedMenuItem: selectedMenuItem,
        rowMainAxisAlignment: rowMainAxisAlignment,
        rowCrossAxisAlignment: rowCrossAxisAlignment,
      );
}
