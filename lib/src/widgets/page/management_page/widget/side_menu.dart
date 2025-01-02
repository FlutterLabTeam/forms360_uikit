import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/extension/menu_item_type_extension.dart';
import 'package:forms360_uikit/src/widgets/page/management_page/widget/avatar_circular_initial.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    super.key,
    this.isHorizontal = false,
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
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final List<MenuItemTypeKit> menuItemsList = MenuItemTypeKit.values;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(62, 30, 12, 30),
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItemsList.map((type) {
              return _buildTappableMenuItem(type);
            }).toList()
              ..add(
                SizedBox(height: 42),
              )
              ..add(
                _buildProfileIcon(),
              ),
          ),
        ),
      ),
    );
  }

  GestureDetector _buildProfileIcon() {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AvatarCircularInitial(
          backgroundColor: AvatarBackgroundColor.HARD_GREEN,
          name: widget.profileLetter,
          size: 24,
        ),
      ),
      onTap: widget.onProfileTap,
    );
  }

  Widget _buildTappableMenuItem(MenuItemTypeKit item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          child:
              MenuIcon(type: item, isSelected: widget.selectedMenuItem == item),
          onTap: () {
            widget.onMenuItemSelected(item);
          },
        ),
        SizedBox(height: 42),
      ],
    );
  }
}
