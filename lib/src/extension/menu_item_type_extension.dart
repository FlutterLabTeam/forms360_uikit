import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/model/menu_item_type_type.dart';

extension MenuIconTypeExtension on MenuItemTypeKit {
  IconData get iconDataSelected {
    switch (this) {
      case MenuItemTypeKit.DASHBOARD:
        return Icons.dashboard;
      case MenuItemTypeKit.USERS:
        return Icons.people;
      case MenuItemTypeKit.AUDIT:
        return Icons.history;
      case MenuItemTypeKit.PERMISSIONS:
        return Icons.security;
      case MenuItemTypeKit.ANNOUNCEMENT:
        return Icons.notifications;
      case MenuItemTypeKit.INDUSTRY:
        return Icons.business;
      case MenuItemTypeKit.LIBRARY:
        return Icons.library_books;
      case MenuItemTypeKit.TAG:
        return Icons.library_books;
      case MenuItemTypeKit.REPORTS:
        return Icons.analytics;
      case MenuItemTypeKit.DATASOURCE:
        return Icons.folder;
      case MenuItemTypeKit.CLIENT:
        return Icons.person;
      case MenuItemTypeKit.PRODUCT:
        return Icons.fact_check;
      case MenuItemTypeKit.TASK:
        return Icons.task_alt_outlined;
    }
  }

  IconData get iconDataUnselected {
    switch (this) {
      case MenuItemTypeKit.DASHBOARD:
        return Icons.dashboard_outlined;
      case MenuItemTypeKit.USERS:
        return Icons.people_outline;
      case MenuItemTypeKit.AUDIT:
        return Icons.history;
      case MenuItemTypeKit.PERMISSIONS:
        return Icons.security_outlined;
      case MenuItemTypeKit.ANNOUNCEMENT:
        return Icons.notifications_outlined;
      case MenuItemTypeKit.INDUSTRY:
        return Icons.business_outlined;
      case MenuItemTypeKit.LIBRARY:
        return Icons.library_books_outlined;
      case MenuItemTypeKit.TAG:
        return Icons.library_books_outlined;
      case MenuItemTypeKit.REPORTS:
        return Icons.analytics_outlined;
      case MenuItemTypeKit.DATASOURCE:
        return Icons.folder_outlined;
      case MenuItemTypeKit.CLIENT:
        return Icons.person_2_outlined;
      case MenuItemTypeKit.PRODUCT:
        return Icons.fact_check_outlined;
      case MenuItemTypeKit.TASK:
        return Icons.task_alt_outlined;
    }
  }

  Icon get iconSelected {
    return Icon(iconDataSelected, color: Colors.blue);
  }

  Icon get iconUnselected {
    return Icon(iconDataUnselected, color: Colors.grey);
  }
}

extension MenuIconTypeStringExtension on MenuItemTypeKit {
  String get toMenuTitle {
    switch (this) {
      case MenuItemTypeKit.DASHBOARD:
        return 'Dashboard';
      case MenuItemTypeKit.DATASOURCE:
        return 'Data source';
      case MenuItemTypeKit.USERS:
        return 'Users';
      case MenuItemTypeKit.AUDIT:
        return 'Audit';
      case MenuItemTypeKit.PERMISSIONS:
        return 'Permissions';
      case MenuItemTypeKit.ANNOUNCEMENT:
        return 'Announce';
      case MenuItemTypeKit.INDUSTRY:
        return 'Industry';
      case MenuItemTypeKit.LIBRARY:
        return 'Library';
      case MenuItemTypeKit.TAG:
        return 'Library';
      case MenuItemTypeKit.REPORTS:
        return "Reports";
      case MenuItemTypeKit.CLIENT:
        return "Client";
      case MenuItemTypeKit.PRODUCT:
        return "Product";
      case MenuItemTypeKit.TASK:
        return "Task";
    }
  }
}
