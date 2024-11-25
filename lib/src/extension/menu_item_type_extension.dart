import 'package:flutter/material.dart';
import 'package:forms360_uikit/src/model/menu_item_type_type.dart';

extension MenuIconTypeExtension on MenuItemType {
  Image get iconSelected {
    switch (this) {
      case MenuItemType.DASHBOARD:
        return Image.asset('assets/icons/menu/dashboard_selected.png');
      case MenuItemType.USERS:
        return Image.asset('assets/icons/menu/clients_selected.png');
      case MenuItemType.AUDIT:
        return Image.asset('assets/icons/menu/audit_selected.png');
      case MenuItemType.PERMISSIONS:
        return Image.asset('assets/icons/menu/permissions_selected.png');
      case MenuItemType.ANNOUNCEMENT:
        return Image.asset('assets/icons/menu/announcement_selected.png');
      case MenuItemType.INDUSTRY:
        return Image.asset('assets/icons/menu/industry_selected.png');
      case MenuItemType.LIBRARY:
        return Image.asset('assets/icons/menu/library_selected.png');
    }
  }

  Image get iconUnselected {
    switch (this) {
      case MenuItemType.DASHBOARD:
        return Image.asset('assets/icons/menu/dashboard_unselected.png');
      case MenuItemType.USERS:
        return Image.asset('assets/icons/menu/clients_unselected.png');
      case MenuItemType.AUDIT:
        return Image.asset('assets/icons/menu/audit_unselected.png');
      case MenuItemType.PERMISSIONS:
        return Image.asset('assets/icons/menu/permissions_unselected.png');
      case MenuItemType.ANNOUNCEMENT:
        return Image.asset('assets/icons/menu/announcement_unselected.png');
      case MenuItemType.INDUSTRY:
        return Image.asset('assets/icons/menu/industry_unselected.png');
      case MenuItemType.LIBRARY:
        return Image.asset('assets/icons/menu/library_unselected.png');
    }
  }
}

extension MenuIconTypeStringExtension on MenuItemType {
  String get toMenuTitle {
    switch (this) {
      case MenuItemType.DASHBOARD:
        return 'Dashboard';
      case MenuItemType.USERS:
        return 'Users';
      case MenuItemType.AUDIT:
        return 'Audit';
      case MenuItemType.PERMISSIONS:
        return 'Permissions';
      case MenuItemType.ANNOUNCEMENT:
        return 'Notify';
      case MenuItemType.INDUSTRY:
        return 'Industry';
      case MenuItemType.LIBRARY:
        return 'Library';
    }
  }
}

class MenuIcon extends StatelessWidget {
  const MenuIcon({
    super.key,
    required this.type,
    this.isSelected = false,
  });

  final MenuItemType type;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
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
    );
  }
}
