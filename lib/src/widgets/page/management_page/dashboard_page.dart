import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/widgets/page/management_page/widget/side_menu.dart';
import 'package:forms360_uikit/src/model/screen_breakpoints.dart';
import 'package:forms360_uikit/src/model/menu_item_type_type.dart';
import 'package:forms360_uikit/src/widgets/page/management_page/widget/top_menu.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    super.key,
    this.serviceWeb,
    required this.spacing,
    required this.endContent,
    required this.onProfileTap,
    required this.profileLetter,
    required this.selectedMenuItem,
    required this.onMenuItemSelected,
  });

  final double spacing;
  final bool? serviceWeb;
  final Widget endContent;
  final String profileLetter;
  final GestureTapCallback onProfileTap;
  final MenuItemTypeKit selectedMenuItem;
  final Function(MenuItemTypeKit) onMenuItemSelected;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= Breakpoint.xdesktop ||
            (constraints.maxWidth >= Breakpoint.tablet &&
                constraints.maxWidth < Breakpoint.xdesktop)) {
          return BigScreenWidget(
            spacing: spacing,
            serviceWeb: serviceWeb,
            endContent: endContent,
            onProfileTap: onProfileTap,
            profileLetter: profileLetter,
            selectedMenuItem: selectedMenuItem,
            onMenuItemSelected: onMenuItemSelected,
          );
        } else {
          return SmallScreenWidget(
            endContent: endContent,
            onProfileTap: onProfileTap,
            profileLetter: profileLetter,
            selectedMenuItem: selectedMenuItem,
            onMenuItemSelected: onMenuItemSelected,
          );
        }
      },
    );
  }
}

class SmallScreenWidget extends StatelessWidget {
  const SmallScreenWidget({
    super.key,
    required this.endContent,
    required this.onProfileTap,
    required this.profileLetter,
    required this.selectedMenuItem,
    required this.onMenuItemSelected,
  });

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
        children: [
          Padding(
            child: endContent,
            padding: const EdgeInsets.only(top: 100.0, right: 24, left: 24),
          ),
          TopMenu(
            isHorizontal: false,
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
    this.serviceWeb,
    required this.spacing,
    required this.endContent,
    required this.onProfileTap,
    required this.profileLetter,
    required this.selectedMenuItem,
    required this.onMenuItemSelected,
  });

  final double spacing;
  final bool? serviceWeb;
  final Widget endContent;
  final String profileLetter;
  final GestureTapCallback onProfileTap;
  final MenuItemTypeKit selectedMenuItem;
  final Function(MenuItemTypeKit) onMenuItemSelected;

  @override
  Widget build(BuildContext context) {
    return DashboardResponsiveTwoColumnLayout(
      startContent: SideMenu(
        serviceWeb: serviceWeb,
        onProfileTap: onProfileTap,
        profileLetter: profileLetter,
        selectedMenuItem: selectedMenuItem,
        onMenuItemSelected: onMenuItemSelected,
      ),
      endContent: endContent,
      spacing: spacing,
    );
  }
}

class DashboardResponsiveTwoColumnLayout extends StatelessWidget {
  const DashboardResponsiveTwoColumnLayout({
    super.key,
    required this.startContent,
    required this.endContent,
    this.breakpoint = Breakpoint.tablet,
    required this.spacing,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
    this.rowCrossAxisAlignment = CrossAxisAlignment.start,
    this.columnMainAxisAlignment = MainAxisAlignment.start,
    this.columnCrossAxisAlignment = CrossAxisAlignment.stretch,
  });

  final Widget startContent;
  final Widget endContent;
  final double breakpoint;
  final double spacing;
  final MainAxisAlignment rowMainAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final MainAxisAlignment columnMainAxisAlignment;
  final CrossAxisAlignment columnCrossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= breakpoint) {
        return Row(
          mainAxisAlignment: rowMainAxisAlignment,
          crossAxisAlignment: rowCrossAxisAlignment,
          mainAxisSize: MainAxisSize.max,
          children: [
            startContent,
            SizedBox(width: spacing),
            Expanded(child: endContent),
            SizedBox(width: spacing),
          ],
        );
      } else {
        return endContent;
      }
    });
  }
}
