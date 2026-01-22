import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/model/screen_breakpoints.dart';
import 'package:forms360_uikit/src/model/menu_item_type_type.dart';
import 'package:forms360_uikit/src/widgets/page/management_page/widget/top_menu.dart';
import 'package:forms360_uikit/src/widgets/page/management_page/widget/side_menu.dart';

class ManagementPage extends StatelessWidget {
  const ManagementPage({
    super.key,
    this.onPop,
    this.serviceWeb,
    required this.spacing,
    required this.assetPath,
    required this.endContent,
    this.startContent,
    required this.onProfileTap,
    required this.profileLetter,
    required this.selectedMenuItem,
    required this.onMenuItemSelected,
    required this.rowMainAxisAlignment,
    required this.rowCrossAxisAlignment,
    required this.enableGoHome,
    this.hasBackButton = false,
    this.title = '',
    this.secondTitle = '',
    this.thirdTitle = '',
    this.selectedTabIndex = 0,
    this.onTitleTap,
    this.onSecondTitleTap,
    this.onThirdTitleTap,
    this.menuItems,
  });

  final double spacing;
  final bool? serviceWeb;
  final String assetPath;
  final Widget endContent;
  final bool enableGoHome;
  final Widget? startContent;
  final VoidCallback? onPop;
  final String profileLetter;
  final GestureTapCallback onProfileTap;
  final MenuItemTypeKit selectedMenuItem;
  final MainAxisAlignment rowMainAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final Function(MenuItemTypeKit) onMenuItemSelected;
  final bool hasBackButton;
  final String title;
  final String secondTitle;
  final String thirdTitle;
  final int selectedTabIndex;
  final VoidCallback? onTitleTap;
  final VoidCallback? onSecondTitleTap;
  final VoidCallback? onThirdTitleTap;
  final List<MenuItemTypeKit>? menuItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.surfaceContainerColor.withOpacity(0.4),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= Breakpoint.tablet) {
            return BigScreenWidget(
              title: title,
              secondTitle: secondTitle,
              thirdTitle: thirdTitle,
              selectedTabIndex: selectedTabIndex,
              onTitleTap: onTitleTap,
              onSecondTitleTap: onSecondTitleTap,
              onThirdTitleTap: onThirdTitleTap,
              onPop: onPop,
              spacing: spacing,
              assetPath: assetPath,
              endContent: endContent,
              serviceWeb: serviceWeb,
              startContent: startContent,
              onProfileTap: onProfileTap,
              enableGoHome: enableGoHome,
              profileLetter: profileLetter,
              selectedMenuItem: selectedMenuItem,
              onMenuItemSelected: onMenuItemSelected,
              rowMainAxisAlignment: rowMainAxisAlignment,
              rowCrossAxisAlignment: rowCrossAxisAlignment,
              hasBackButton: hasBackButton,
              menuItems: menuItems,
            );
          } else {
            return SmallScreenWidget(
              endContent: endContent,
              serviceWeb: serviceWeb,
              onProfileTap: onProfileTap,
              profileLetter: profileLetter,
              selectedMenuItem: selectedMenuItem,
              onMenuItemSelected: onMenuItemSelected,
            );
          }
        },
      ),
    );
  }
}

class SmallScreenWidget extends StatelessWidget {
  const SmallScreenWidget({
    super.key,
    this.serviceWeb,
    required this.endContent,
    required this.onProfileTap,
    required this.profileLetter,
    required this.selectedMenuItem,
    required this.onMenuItemSelected,
  });

  final bool? serviceWeb;
  final Widget endContent;
  final String profileLetter;
  final GestureTapCallback onProfileTap;
  final MenuItemTypeKit selectedMenuItem;
  final Function(MenuItemTypeKit) onMenuItemSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            child: endContent,
            padding: const EdgeInsets.only(top: 100.0, right: 24, left: 24),
          ),
          TopMenu(
            isHorizontal: false,
            serviceWeb: serviceWeb,
            onProfileTap: onProfileTap,
            profileLetter: profileLetter,
            selectedMenuItem: selectedMenuItem,
            onMenuItemSelected: onMenuItemSelected,
          ),
        ],
      ),
    );
  }
}

class BigScreenWidget extends StatelessWidget {
  const BigScreenWidget({
    super.key,
    this.onPop,
    this.serviceWeb,
    required this.spacing,
    required this.endContent,
    this.startContent,
    required this.enableGoHome,
    required this.onProfileTap,
    required this.profileLetter,
    required this.selectedMenuItem,
    required this.onMenuItemSelected,
    required this.rowMainAxisAlignment,
    required this.rowCrossAxisAlignment,
    this.hasBackButton = false,
    this.assetPath = 'assets/images/clients/users_background.png',
    required this.title,
    required this.secondTitle,
    this.thirdTitle = '',
    this.selectedTabIndex = 0,
    this.onTitleTap,
    this.onSecondTitleTap,
    this.onThirdTitleTap,
    this.menuItems,
  });

  final double spacing;
  final bool? serviceWeb;
  final String assetPath;
  final bool enableGoHome;
  final Widget endContent;
  final Widget? startContent;
  final VoidCallback? onPop;
  final String profileLetter;
  final GestureTapCallback onProfileTap;
  final MenuItemTypeKit selectedMenuItem;
  final MainAxisAlignment rowMainAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final Function(MenuItemTypeKit) onMenuItemSelected;
  final bool hasBackButton;
  final String title;
  final String secondTitle;
  final String thirdTitle;
  final int selectedTabIndex;
  final VoidCallback? onTitleTap;
  final VoidCallback? onSecondTitleTap;
  final VoidCallback? onThirdTitleTap;
  final List<MenuItemTypeKit>? menuItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.surfaceContainerColor.withOpacity(0.4),
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 8),
      child: Row(
        mainAxisAlignment: rowMainAxisAlignment,
        crossAxisAlignment: rowCrossAxisAlignment,
        children: [
          SideMenu(
            serviceWeb: serviceWeb,
            menuItems: menuItems,
            onProfileTap: onProfileTap,
            profileLetter: profileLetter,
            selectedMenuItem: selectedMenuItem,
            onMenuItemSelected: onMenuItemSelected,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    if (title.isNotEmpty) ...[
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: Row(
                          children: [
                            _TabTitle(
                              title: title,
                              isSelected: selectedTabIndex == 0,
                              onTap: onTitleTap,
                            ),
                            if (secondTitle.isNotEmpty) ...[
                              const SizedBox(width: 24),
                              _TabTitle(
                                title: secondTitle,
                                isSelected: selectedTabIndex == 1,
                                onTap: onSecondTitleTap,
                              ),
                            ],
                            if (thirdTitle.isNotEmpty) ...[
                              const SizedBox(width: 24),
                              _TabTitle(
                                title: thirdTitle,
                                isSelected: selectedTabIndex == 2,
                                onTap: onThirdTitleTap,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 80.0,
                          right: 100.0,
                          bottom: 40,
                          top: 20,
                        ),
                        child: endContent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: spacing),
        ],
      ),
    );
  }
}

class _TabTitle extends StatelessWidget {
  const _TabTitle({required this.title, required this.isSelected, this.onTap});

  final String title;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Text(
          title,
          style: context.primaryText.copyWith(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: isSelected
                ? context.primaryColor
                : context.primaryColor.withOpacity(0.4),
          ),
        ),
      ),
    ).cursorGestureWithHover;
  }
}
