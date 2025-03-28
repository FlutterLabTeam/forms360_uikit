import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/page/management_page/widget/avatar_circular_initial.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    super.key,
    this.serviceWeb = false,
    this.isHorizontal = false,
    required this.onProfileTap,
    required this.profileLetter,
    required this.selectedMenuItem,
    required this.onMenuItemSelected,
  });

  final bool? serviceWeb;
  final bool isHorizontal;
  final String profileLetter;
  final GestureTapCallback onProfileTap;
  final MenuItemTypeKit selectedMenuItem;
  final Function(MenuItemTypeKit) onMenuItemSelected;

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  List<MenuItemTypeKit> menuList =  menuItemList;

  @override
  Widget build(BuildContext context) {
    if(widget.serviceWeb != null && widget.serviceWeb!) menuList = menuItemListService;
    return Container(
      height: double.infinity,
      margin: EdgeInsets.fromLTRB(62, 30, 12, 30),
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: menuList
                      .map((type) => _buildTappableMenuItem(type))
                      .toList()
                    ..add(
                      SizedBox(height: 42),
                    )),
            ),
          ),
          Align(alignment: Alignment.bottomCenter, child: _buildProfileIcon())
        ],
      ),
    );
  }

  GestureDetector _buildProfileIcon() {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: AvatarCircularInitial(
          backgroundColor: AvatarBackgroundColor.HARD_GREEN,
          name: widget.profileLetter,
          size: 24,
        ),
      ).cursorGestureWithHover,
      onTap: widget.onProfileTap,
    );
  }

  Widget _buildTappableMenuItem(MenuItemTypeKit item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MenuIcon(
            type: item,
            isSelected: widget.selectedMenuItem == item,
            onMenuItemSelected: widget.onMenuItemSelected,
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
