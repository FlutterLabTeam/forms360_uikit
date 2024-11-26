import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/extension/menu_item_type_extension.dart';
import 'package:forms360_uikit/src/model/menu_item_type_type.dart';
import 'package:forms360_uikit/src/widgets/page/management_page/widget/avatar_circular_initial.dart';

class TopMenu extends StatefulWidget {
  const TopMenu({
    super.key,
    this.isHorizontal = true,
    required this.selectedMenuItem,
  });

  final bool isHorizontal;
  final MenuItemTypeKit selectedMenuItem;

  @override
  State<TopMenu> createState() => _TopMenuState();
}

class _TopMenuState extends State<TopMenu> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: widget.isHorizontal
          ? Row(
              children: _listComponents,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            )
          : Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: IconButton(
                            onPressed: () => setState(() {
                              isTapped = !isTapped;
                            }),
                            icon: Icon(Icons.menu),
                          ),
                        ),
                        Text(
                          widget.selectedMenuItem.toMenuTitle,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                        AvatarCircularInitial(name: 'A', size: 24),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: isTapped,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: Column(children: _columnComponents),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  List<Widget> get _listComponents => [
        MenuIcon(
          type: MenuItemTypeKit.DASHBOARD,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.DASHBOARD,
        ),
        SizedBox(width: 12),
        MenuIcon(
          type: MenuItemTypeKit.USERS,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.USERS,
        ),
        SizedBox(width: 12),
        MenuIcon(
          type: MenuItemTypeKit.AUDIT,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.AUDIT,
        ),
        SizedBox(width: 12),
        MenuIcon(
          type: MenuItemTypeKit.PERMISSIONS,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.PERMISSIONS,
        ),
        SizedBox(width: 12),
        MenuIcon(
          type: MenuItemTypeKit.ANNOUNCEMENT,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.ANNOUNCEMENT,
        ),
        SizedBox(width: 12),
        MenuIcon(
          type: MenuItemTypeKit.INDUSTRY,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.INDUSTRY,
        ),
        SizedBox(width: 12),
        MenuIcon(
          type: MenuItemTypeKit.LIBRARY,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.LIBRARY,
        ),
        Spacer(),
        AvatarCircularInitial(name: 'A', size: 24),
      ];

  List<Widget> get _columnComponents => [
        SizedBox(height: 52),
        MenuIcon(
          type: MenuItemTypeKit.DASHBOARD,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.DASHBOARD,
        ),
        SizedBox(height: 52),
        MenuIcon(
          type: MenuItemTypeKit.USERS,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.USERS,
        ),
        SizedBox(height: 52),
        MenuIcon(
          type: MenuItemTypeKit.AUDIT,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.AUDIT,
        ),
        SizedBox(height: 52),
        MenuIcon(
          type: MenuItemTypeKit.PERMISSIONS,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.PERMISSIONS,
        ),
        SizedBox(height: 52),
        MenuIcon(
          type: MenuItemTypeKit.ANNOUNCEMENT,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.ANNOUNCEMENT,
        ),
        SizedBox(height: 52),
        MenuIcon(
          type: MenuItemTypeKit.INDUSTRY,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.INDUSTRY,
        ),
        SizedBox(height: 52),
        MenuIcon(
          type: MenuItemTypeKit.LIBRARY,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.LIBRARY,
        ),
        SizedBox(height: 52),
      ];
}
