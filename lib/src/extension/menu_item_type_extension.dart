import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/model/menu_item_type_type.dart';

extension MenuIconTypeExtension on MenuItemTypeKit {
  Icon get iconSelected {
    switch (this) {
      case MenuItemTypeKit.DASHBOARD:
        return Icon(Icons.dashboard, color: Colors.blue);
      case MenuItemTypeKit.USERS:
        return Icon(Icons.people, color: Colors.blue);
      case MenuItemTypeKit.AUDIT:
        return Icon(Icons.history, color: Colors.blue);
      case MenuItemTypeKit.PERMISSIONS:
        return Icon(Icons.security, color: Colors.blue);
      case MenuItemTypeKit.ANNOUNCEMENT:
        return Icon(Icons.notifications, color: Colors.blue);
      case MenuItemTypeKit.INDUSTRY:
        return Icon(Icons.business, color: Colors.blue);
      case MenuItemTypeKit.LIBRARY:
        return Icon(Icons.library_books, color: Colors.blue);
      case MenuItemTypeKit.TAG:
        return Icon(Icons.library_books, color: Colors.blue);
    }
  }

  Icon get iconUnselected {
    switch (this) {
      case MenuItemTypeKit.DASHBOARD:
        return Icon(Icons.dashboard, color: Colors.grey);
      case MenuItemTypeKit.USERS:
        return Icon(Icons.people, color: Colors.grey);
      case MenuItemTypeKit.AUDIT:
        return Icon(Icons.history, color: Colors.grey);
      case MenuItemTypeKit.PERMISSIONS:
        return Icon(Icons.security, color: Colors.grey);
      case MenuItemTypeKit.ANNOUNCEMENT:
        return Icon(Icons.notifications, color: Colors.grey);
      case MenuItemTypeKit.INDUSTRY:
        return Icon(Icons.business, color: Colors.grey);
      case MenuItemTypeKit.LIBRARY:
        return Icon(Icons.library_books, color: Colors.grey);
      case MenuItemTypeKit.TAG:
        return Icon(Icons.library_books, color: Colors.grey);
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
      case MenuItemTypeKit.TAG:
        return 'Library';
    }
  }
}
