import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/extension/menu_item_type_extension.dart';
import 'package:forms360_uikit/src/widgets/page/management_page/widget/avatar_circular_initial.dart';

class TopMenu extends StatefulWidget {
  const TopMenu({
    super.key,
    this.serviceWeb = false,
    this.isHorizontal = true,
    required this.onProfileTap,
    required this.profileLetter,
    required this.selectedMenuItem,
    required this.onMenuItemSelected,
    this.customMenuItems,
  });

  final bool? serviceWeb;
  final bool isHorizontal;
  final String profileLetter;
  final GestureTapCallback onProfileTap;
  final MenuItemTypeKit selectedMenuItem;
  final Function(MenuItemTypeKit) onMenuItemSelected;
  final List<Widget>? customMenuItems;

  @override
  State<TopMenu> createState() => _TopMenuState();
}

class _TopMenuState extends State<TopMenu> {
  bool isTapped = false;
  List<MenuItemTypeKit> menuList = menuItemList;

  @override
  Widget build(BuildContext context) {
    if (widget.serviceWeb != null && widget.serviceWeb!)
      menuList = menuItemListService;

    // Si serviceWeb es true y hay customMenuItems, usarlos
    final bool useCustomItems = widget.serviceWeb == true &&
        widget.customMenuItems != null &&
        widget.customMenuItems!.isNotEmpty;

    return Container(
      child: widget.isHorizontal
          ? Row(
              children: useCustomItems
                  ? [
                      ...widget.customMenuItems!,
                      Spacer(),
                    ]
                  : menuList
                      .map((type) => _buildTappableMenuItem(type))
                      .toList()
                ..add(Spacer())
                ..add(_buildProfileIcon()),
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            )
          : Container(
              height: context.sizeHeight(0.9),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
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
                          child: Container(
                              width:
                                  24) /* IconButton(
                            onPressed: () => setState(() {
                              isTapped = !isTapped;
                            }),
                            icon: Icon(Icons.menu),
                          ) */
                          ,
                        ),
                        Text(
                          widget.selectedMenuItem.toMenuTitle,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(color: Theme.of(context).primaryColor),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 16),
                          child: GestureDetector(
                            child: AvatarCircularInitial(
                              size: 24,
                              name: widget.profileLetter,
                            ),
                            onTap: widget.onProfileTap,
                          ).cursorGestureWithHover,
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: isTapped,
                    child: Container(
                      height: context.sizeHeight(0.7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: SingleChildScrollView(
                        child: Column(children: _columnComponents),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  _buildProfileIcon() {
    return GestureDetector(
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(5),
        child: AvatarCircularInitial(name: widget.profileLetter, size: 24),
      ),
      onTap: widget.onProfileTap,
    ).cursorGestureWithHover;
  }

  Widget _buildTappableMenuItem(MenuItemTypeKit item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: MenuIcon(
        type: item,
        isSelected: widget.selectedMenuItem == item,
        onMenuItemSelected: widget.onMenuItemSelected,
      ),
    );
  }

  List<Widget> get _columnComponents => [
        SizedBox(height: 30),
        MenuIcon(
          type: MenuItemTypeKit.DASHBOARD,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.DASHBOARD,
          onMenuItemSelected: (p0) => widget.onMenuItemSelected(p0),
        ),
        SizedBox(height: 30),
        MenuIcon(
          type: MenuItemTypeKit.USERS,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.USERS,
          onMenuItemSelected: (p0) => widget.onMenuItemSelected(p0),
        ),
        SizedBox(height: 30),
        MenuIcon(
          type: MenuItemTypeKit.AUDIT,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.AUDIT,
          onMenuItemSelected: (p0) => widget.onMenuItemSelected(p0),
        ),
        SizedBox(height: 30),
        MenuIcon(
          type: MenuItemTypeKit.PERMISSIONS,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.PERMISSIONS,
          onMenuItemSelected: (p0) => widget.onMenuItemSelected(p0),
        ),
        SizedBox(height: 30),
        MenuIcon(
          type: MenuItemTypeKit.ANNOUNCEMENT,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.ANNOUNCEMENT,
          onMenuItemSelected: (p0) => widget.onMenuItemSelected(p0),
        ),
        SizedBox(height: 30),
        MenuIcon(
          type: MenuItemTypeKit.INDUSTRY,
          isSelected: widget.selectedMenuItem == MenuItemTypeKit.INDUSTRY,
          onMenuItemSelected: (p0) => widget.onMenuItemSelected(p0),
        ),
        SizedBox(height: 30),
      ];
}
