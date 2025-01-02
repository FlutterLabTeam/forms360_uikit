import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/model/menu_item_type_type.dart';

extension MenuIconTypeExtension on MenuItemTypeKit {
  Image get iconSelected {
    switch (this) {
      case MenuItemTypeKit.DASHBOARD:
        return Image.asset('assets/icons/menu/dashboard_selected.png');
      case MenuItemTypeKit.USERS:
        return Image.asset('assets/icons/menu/clients_selected.png');
      case MenuItemTypeKit.AUDIT:
        return Image.asset('assets/icons/menu/audit_selected.png');
      case MenuItemTypeKit.PERMISSIONS:
        return Image.asset('assets/icons/menu/permissions_selected.png');
      case MenuItemTypeKit.ANNOUNCEMENT:
        return Image.asset('assets/icons/menu/announcement_selected.png');
      case MenuItemTypeKit.INDUSTRY:
        return Image.asset('assets/icons/menu/industry_selected.png');
      case MenuItemTypeKit.LIBRARY:
        return Image.asset('assets/icons/menu/library_selected.png');
    }
  }

  Image get iconUnselected {
    switch (this) {
      case MenuItemTypeKit.DASHBOARD:
        return Image.asset('assets/icons/menu/dashboard_unselected.png');
      case MenuItemTypeKit.USERS:
        return Image.asset('assets/icons/menu/clients_unselected.png');
      case MenuItemTypeKit.AUDIT:
        return Image.asset('assets/icons/menu/audit_unselected.png');
      case MenuItemTypeKit.PERMISSIONS:
        return Image.asset('assets/icons/menu/permissions_unselected.png');
      case MenuItemTypeKit.ANNOUNCEMENT:
        return Image.asset('assets/icons/menu/announcement_unselected.png');
      case MenuItemTypeKit.INDUSTRY:
        return Image.asset('assets/icons/menu/industry_unselected.png');
      case MenuItemTypeKit.LIBRARY:
        return Image.asset('assets/icons/menu/library_unselected.png');
    }
  }
}

extension MenuIconTypeStringExtension on MenuItemTypeKit {
  String get toMenuTitle {
    switch (this) {
      case MenuItemTypeKit.DASHBOARD:
        return 'Dashboard';
      case MenuItemTypeKit.USERS:
        return 'Users';
      case MenuItemTypeKit.AUDIT:
        return 'Audit';
      case MenuItemTypeKit.PERMISSIONS:
        return 'Permissions';
      case MenuItemTypeKit.ANNOUNCEMENT:
        return 'Notify';
      case MenuItemTypeKit.INDUSTRY:
        return 'Industry';
      case MenuItemTypeKit.LIBRARY:
        return 'Library';
    }
  }
}

class MenuIcon extends StatelessWidget {
  const MenuIcon({
    super.key,
    required this.type,
    this.isSelected = false,
    required this.onMenuItemSelected,
  });

  final MenuItemTypeKit type;
  final bool isSelected;
  final Function(MenuItemTypeKit) onMenuItemSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
      child: GestureDetector(
        onTap: () => onMenuItemSelected(type),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24,
              height: 24,
              child: isSelected ? type.iconSelected : type.iconUnselected,
            ),
            SizedBox(height: 10),
            Text(
              type.toMenuTitle,
              style: TextStyle(
                color: isSelected ? Color(0xFF1E5C8B) : Color(0xFFA3B2BC),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
