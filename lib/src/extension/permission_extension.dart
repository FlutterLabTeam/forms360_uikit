import 'package:forms360_uikit/src/model/permission_type.dart';

extension PermissionExtension on PermissionType {
  String toName() {
    switch (this) {
      case PermissionType.USERS:
        return "User";
      case PermissionType.CLIENTS:
        return "Clients";
      case PermissionType.PROFILE:
        return "Profile";
      case PermissionType.ANNOUNCEMENTS:
        return "Announcements";
      case PermissionType.ACTIVITY_LOGGER:
        return "Activity logger";
      case PermissionType.INDUSTRY_PACKAGE:
        return "Industry package";
      case PermissionType.DASHBOARD_SYSTEM_REPORTS:
        return "Dashboard system reports";
      case PermissionType.DASHBOARD_BUSINESS_REPORTS:
        return "Dashboard business reports";
    }
  }
}

extension PermissionOptionsExtension on PermissionOptionsType {
  String toName() {
    switch (this) {
      case PermissionOptionsType.CREATE:
        return "Create";
      case PermissionOptionsType.UPDATE:
        return "Edit";
      case PermissionOptionsType.READ:
        return "Read";
      case PermissionOptionsType.DELETE:
        return "Deleted";
    }
  }
}
