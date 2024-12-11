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
    required this.selectedMenuItem,
    required this.rowMainAxisAlignment,
    required this.rowCrossAxisAlignment,
  });

  final double spacing;
  final String assetPath;
  final Widget endContent;
  final Widget startContent;
  final MenuItemTypeKit selectedMenuItem;
  final MainAxisAlignment rowMainAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;

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
            selectedMenuItem: selectedMenuItem,
            rowMainAxisAlignment: rowMainAxisAlignment,
            rowCrossAxisAlignment: rowCrossAxisAlignment,
          );
        } else if (constraints.maxWidth >= Breakpoint.tablet &&
            constraints.maxWidth < Breakpoint.xdesktop) {
          return MediumScreenWidget(
            spacing: spacing,
            endContent: endContent,
            selectedMenuItem: selectedMenuItem,
            rowMainAxisAlignment: rowMainAxisAlignment,
            rowCrossAxisAlignment: rowCrossAxisAlignment,
          );
        } else {
          return SmallScreenWidget(
            endContent: endContent,
            selectedMenuItem: selectedMenuItem,
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
    required this.selectedMenuItem,
  });

  final Widget endContent;
  final MenuItemTypeKit selectedMenuItem;

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
            selectedMenuItem: selectedMenuItem,
          ),
        ],
      ),
    );
  }
}

class MediumScreenWidget extends StatelessWidget {
  const MediumScreenWidget({
    super.key,
    required this.rowMainAxisAlignment,
    required this.rowCrossAxisAlignment,
    required this.spacing,
    required this.selectedMenuItem,
    required this.endContent,
  });

  final MainAxisAlignment rowMainAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final double spacing;
  final MenuItemTypeKit selectedMenuItem;
  final Widget endContent;

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
                    ),
                    child: TopMenu(selectedMenuItem: selectedMenuItem),
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
    required this.selectedMenuItem,
    required this.rowMainAxisAlignment,
    required this.rowCrossAxisAlignment,
    this.assetPath = 'assets/images/clients/users_background.png',
  });

  final double spacing;
  final String assetPath;
  final Widget endContent;
  final Widget startContent;
  final MenuItemTypeKit selectedMenuItem;
  final MainAxisAlignment rowMainAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;

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
                    ),
                    child: TopMenu(selectedMenuItem: selectedMenuItem),
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
  });

  final Widget startContent;
  final String assetPath;

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
            onPressed: () => context.pop(),
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
