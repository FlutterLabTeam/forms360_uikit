import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:forms360_uikit/src/model/screen_breakpoints.dart';
import 'package:forms360_uikit/src/model/menu_item_type_type.dart';
import 'package:forms360_uikit/src/widgets/page/management_page/widget/logo.dart';
import 'package:forms360_uikit/src/widgets/page/management_page/widget/top_menu.dart';

class ManagementPage extends StatelessWidget {
  const ManagementPage({
    super.key,
    required this.spacing,
    required this.assetPath,
    required this.endContent,
    required this.startContent,
    required this.onProfileTap,
    required this.profileLetter,
    required this.selectedMenuItem,
    required this.onMenuItemSelected,
    required this.rowMainAxisAlignment,
    required this.rowCrossAxisAlignment,
    required this.enableGoHome,
  });

  final double spacing;
  final String assetPath;
  final Widget endContent;
  final Widget startContent;
  final String profileLetter;
  final GestureTapCallback onProfileTap;
  final MenuItemTypeKit selectedMenuItem;
  final MainAxisAlignment rowMainAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final Function(MenuItemTypeKit) onMenuItemSelected;
  final bool enableGoHome;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= Breakpoint.xdesktop) {
          return BigScreenWidget(
            spacing: spacing,
            assetPath: assetPath,
            endContent: endContent,
            startContent: startContent,
            onProfileTap: onProfileTap,
            profileLetter: profileLetter,
            selectedMenuItem: selectedMenuItem,
            onMenuItemSelected: onMenuItemSelected,
            rowMainAxisAlignment: rowMainAxisAlignment,
            rowCrossAxisAlignment: rowCrossAxisAlignment,
            enableGoHome: enableGoHome,
          );
        } else if (constraints.maxWidth >= Breakpoint.tablet &&
            constraints.maxWidth < Breakpoint.xdesktop) {
          return MediumScreenWidget(
            spacing: spacing,
            endContent: endContent,
            onProfileTap: onProfileTap,
            profileLetter: profileLetter,
            selectedMenuItem: selectedMenuItem,
            onMenuItemSelected: onMenuItemSelected,
            rowMainAxisAlignment: rowMainAxisAlignment,
            rowCrossAxisAlignment: rowCrossAxisAlignment,
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

class MediumScreenWidget extends StatelessWidget {
  const MediumScreenWidget({
    super.key,
    required this.spacing,
    required this.endContent,
    required this.onProfileTap,
    required this.profileLetter,
    required this.selectedMenuItem,
    required this.onMenuItemSelected,
    required this.rowMainAxisAlignment,
    required this.rowCrossAxisAlignment,
  });

  final double spacing;
  final Widget endContent;
  final String profileLetter;
  final GestureTapCallback onProfileTap;
  final MenuItemTypeKit selectedMenuItem;
  final MainAxisAlignment rowMainAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final Function(MenuItemTypeKit) onMenuItemSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24.0,
        left: 24.0,
        bottom: 24.0,
      ),
      child: Row(
        mainAxisAlignment: rowMainAxisAlignment,
        crossAxisAlignment: rowCrossAxisAlignment,
        children: [
          SizedBox(width: spacing),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 100.0,
                      vertical: 20,
                    ),
                    child: TopMenu(
                      onProfileTap: onProfileTap,
                      profileLetter: profileLetter,
                      selectedMenuItem: selectedMenuItem,
                      onMenuItemSelected: onMenuItemSelected,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 100.0,
                        right: 100.0,
                        bottom: 40,
                      ),
                      child: endContent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BigScreenWidget extends StatelessWidget {
  const BigScreenWidget({
    super.key,
    required this.spacing,
    required this.endContent,
    required this.startContent,
    required this.onProfileTap,
    required this.profileLetter,
    required this.selectedMenuItem,
    required this.onMenuItemSelected,
    required this.rowMainAxisAlignment,
    required this.rowCrossAxisAlignment,
    this.assetPath = 'assets/images/clients/users_background.png',
    required this.enableGoHome,
  });

  final double spacing;
  final String assetPath;
  final Widget endContent;
  final Widget startContent;
  final String profileLetter;
  final GestureTapCallback onProfileTap;
  final MenuItemTypeKit selectedMenuItem;
  final MainAxisAlignment rowMainAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final Function(MenuItemTypeKit) onMenuItemSelected;
  final bool enableGoHome;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24.0,
        left: 24.0,
        bottom: 24.0,
      ),
      child: Row(
        mainAxisAlignment: rowMainAxisAlignment,
        crossAxisAlignment: rowCrossAxisAlignment,
        children: [
          SizedBox(width: spacing),
          Expanded(
            flex: 1,
            child: LeftDecoration(
              assetPath: assetPath,
              startContent: startContent,
              enableGoHome: enableGoHome,
            ),
          ),
          SizedBox(width: spacing),
          Flexible(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 100.0,
                      vertical: 20,
                    ),
                    child: TopMenu(
                      onProfileTap: onProfileTap,
                      profileLetter: profileLetter,
                      selectedMenuItem: selectedMenuItem,
                      onMenuItemSelected: onMenuItemSelected,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 100.0,
                        right: 100.0,
                        bottom: 40,
                      ),
                      child: endContent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LeftDecoration extends StatelessWidget {
  const LeftDecoration({
    super.key,
    required this.startContent,
    required this.assetPath,
    required this.enableGoHome,
  });

  final Widget startContent;
  final String assetPath;
  final bool enableGoHome;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(assetPath).image,
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 30,
          child: IconButton(
            onPressed: () => enableGoHome
                ? context.go('/')
                : context.pop(),
            icon: Icon(Icons.chevron_left, color: Colors.white, size: 30),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 53.0),
              child: LogoForms(color: LogoColor.WHITE),
            ),
          ],
        ),
        Center(child: startContent),
      ],
    );
  }
}
