import 'package:flutter/cupertino.dart';
import 'management_page/widget/end_content_widget.dart';
import 'package:forms360_uikit/src/model/menu_item_type_type.dart';
import 'package:forms360_uikit/src/widgets/page/standard_page/standard_page.dart';
import 'package:forms360_uikit/src/widgets/page/management_page/dashboard_page.dart';
import 'package:forms360_uikit/src/widgets/page/management_page/management_page.dart';
import 'package:forms360_uikit/src/widgets/page/management_page/management_multi_page.dart';

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
    bool hasBackButton = false,
    Function()? onPop,
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
        onPop: onPop,
        hasBackButton: hasBackButton,
      );

  Widget managementMultiPage({
    bool? serviceWeb,
    Function()? onPop,
    double spacing = 36,
    bool enableGoHome = false,
    required Widget startContent,
    required String profileLetter,
    required List<Widget> endContent,
    required GestureTapCallback onProfileTap,
    String assetPath = 'assets/images/clients/users_background.png',
    MainAxisAlignment rowMainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment rowCrossAxisAlignment = CrossAxisAlignment.start,
  }) =>
      ManagementMultiPage(
        onPop: onPop,
        spacing: spacing,
        assetPath: assetPath,
        endContent: endContent,
        serviceWeb: serviceWeb,
        enableGoHome: enableGoHome,
        onProfileTap: onProfileTap,
        startContent: startContent,
        profileLetter: profileLetter,
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
    required Function() retryCallBack,
    String searchLabel = 'Search',
    Widget? titleWidget,
    String? errorMessage,
    bool isLoading = false,
    String? retryButtonText,
    List<Widget>? settingsWidgets,
  }) =>
      EndContentWidget(
        content: content,
        onSearch: onSearch,
        searchLabel: searchLabel,
        titleWidget: titleWidget,
        retryButtonText: retryButtonText,
        isLoading: isLoading,
        errorMessage: errorMessage,
        retryCallback: retryCallBack,
        settingsWidgets: settingsWidgets,
      );
}
