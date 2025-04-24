import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/src/model/menu_item_type_type.dart';
import 'package:forms360_uikit/src/widgets/page/standard_page/standard_page.dart';
import 'package:forms360_uikit/src/widgets/page/management_page/dashboard_page.dart';
import 'package:forms360_uikit/src/widgets/page/management_page/management_page.dart';

import 'management_page/widget/end_content_widget.dart';

class UiPage {
  Widget backgroundPage({
    required Widget child,
    required String image,
    String labelPage = "",
  }) =>
      BackgroundPage(child: child, image: image, labelPage: labelPage);

  Widget managementPage({
    bool? serviceWeb,
    double spacing = 36,
    required Widget endContent,
    required Widget startContent,
    required String profileLetter,
    required GestureTapCallback onProfileTap,
    required MenuItemTypeKit selectedMenuItem,
    required Function(MenuItemTypeKit) onMenuItemSelected,
    String assetPath = 'assets/images/clients/users_background.png',
    MainAxisAlignment rowMainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment rowCrossAxisAlignment = CrossAxisAlignment.start,
    bool enableGoHome = false,
  }) =>
      ManagementPage(
        spacing: spacing,
        assetPath: assetPath,
        endContent: endContent,
        serviceWeb: serviceWeb,
        enableGoHome: enableGoHome,
        onProfileTap: onProfileTap,
        startContent: startContent,
        profileLetter: profileLetter,
        selectedMenuItem: selectedMenuItem,
        onMenuItemSelected: onMenuItemSelected,
        rowMainAxisAlignment: rowMainAxisAlignment,
        rowCrossAxisAlignment: rowCrossAxisAlignment,
      );

  Widget dashboardPage({
    double spacing = 36,
    bool? serviceWeb,
    required Widget endContent,
    required String profileLetter,
    required GestureTapCallback onProfileTap,
    required MenuItemTypeKit selectedMenuItem,
    required Function(MenuItemTypeKit) onMenuItemSelected,
  }) =>
      DashboardPage(
        spacing: spacing,
        serviceWeb: serviceWeb,
        endContent: endContent,
        onProfileTap: onProfileTap,
        profileLetter: profileLetter,
        selectedMenuItem: selectedMenuItem,
        onMenuItemSelected: onMenuItemSelected,
      );

  Widget endContentWidget({
    required Widget content,
    required Function(String)? onSearch,
    String searchLabel = 'Search',
    Widget? titleWidget,
  }) =>
      EndContentWidget(
        content: content,
        onSearch: onSearch,
        searchLabel: searchLabel,
        titleWidget: titleWidget,
      );
}
