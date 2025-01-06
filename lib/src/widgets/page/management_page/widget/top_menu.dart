import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/extension/menu_item_type_extension.dart';
import 'package:forms360_uikit/src/model/menu_item_type_type.dart';
import 'package:forms360_uikit/src/widgets/page/management_page/widget/avatar_circular_initial.dart';

class TopMenu extends StatefulWidget {
  const TopMenu({
    super.key,
    this.isHorizontal = true,
    required this.onProfileTap,
    required this.profileLetter,
    required this.selectedMenuItem,
    required this.onMenuItemSelected,
  });

  final bool isHorizontal;
  final String profileLetter;
  final GestureTapCallback onProfileTap;
  final MenuItemTypeKit selectedMenuItem;
  final Function(MenuItemTypeKit) onMenuItemSelected;

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
              children: _listComponents
                ..add(Spacer())
                ..add(_buildProfileIcon()),
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
                    margin: EdgeInsets.only(right: 16),
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
                        GestureDetector(
                            child: AvatarCircularInitial(
                                name: widget.profileLetter, size: 24),
                            onTap: widget.onProfileTap),
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

  _buildProfileIcon() {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AvatarCircularInitial(
          name: widget.profileLetter,
          size: 24,
        ),
      ),
      onTap: widget.onProfileTap,
    );
  }

  List<Widget> get _listComponents => [
        MenuIcon(
          type: MenuItemTypeKit.DASHBOARD,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.DASHBOARD,
          onMenuItemSelected: (p0) => widget.onMenuItemSelected(p0),
        ),
        SizedBox(width: 12),
        MenuIcon(
          type: MenuItemTypeKit.USERS,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.USERS,
          onMenuItemSelected: (p0) => widget.onMenuItemSelected(p0),
        ),
        SizedBox(width: 12),
        MenuIcon(
          type: MenuItemTypeKit.AUDIT,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.AUDIT,
          onMenuItemSelected: (p0) => widget.onMenuItemSelected(p0),
        ),
        SizedBox(width: 12),
        MenuIcon(
          type: MenuItemTypeKit.PERMISSIONS,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.PERMISSIONS,
          onMenuItemSelected: (p0) => widget.onMenuItemSelected(p0),
        ),
        SizedBox(width: 12),
        MenuIcon(
          type: MenuItemTypeKit.ANNOUNCEMENT,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.ANNOUNCEMENT,
          onMenuItemSelected: (p0) => widget.onMenuItemSelected(p0),
        ),
        SizedBox(width: 12),
        MenuIcon(
          type: MenuItemTypeKit.INDUSTRY,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.INDUSTRY,
          onMenuItemSelected: (p0) => widget.onMenuItemSelected(p0),
        ),
      ];

  List<Widget> get _columnComponents => [
        SizedBox(height: 52),
        MenuIcon(
          type: MenuItemTypeKit.DASHBOARD,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.DASHBOARD,
          onMenuItemSelected: (p0) => widget.onMenuItemSelected(p0),
        ),
        SizedBox(height: 52),
        MenuIcon(
          type: MenuItemTypeKit.USERS,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.USERS,
          onMenuItemSelected: (p0) => widget.onMenuItemSelected(p0),
        ),
        SizedBox(height: 52),
        MenuIcon(
          type: MenuItemTypeKit.AUDIT,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.AUDIT,
          onMenuItemSelected: (p0) => widget.onMenuItemSelected(p0),
        ),
        SizedBox(height: 52),
        MenuIcon(
          type: MenuItemTypeKit.PERMISSIONS,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.PERMISSIONS,
          onMenuItemSelected: (p0) => widget.onMenuItemSelected(p0),
        ),
        SizedBox(height: 52),
        MenuIcon(
          type: MenuItemTypeKit.ANNOUNCEMENT,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.ANNOUNCEMENT,
          onMenuItemSelected: (p0) => widget.onMenuItemSelected(p0),
        ),
        SizedBox(height: 52),
        MenuIcon(
          type: MenuItemTypeKit.INDUSTRY,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.INDUSTRY,
          onMenuItemSelected: (p0) => widget.onMenuItemSelected(p0),
        ),
        SizedBox(height: 52),
      ];
}
