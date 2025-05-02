import 'package:forms360_uikit/forms360_uikit.dart';

class UiItem {
  TagItem tagItem({
    required String name,
    required bool isSelected,
    required Function()? onTap,
    required Function()? handledDelete,
  }) =>
      TagItem(
          name: name,
          isSelected: isSelected,
          onTap: onTap,
          handledDelete: handledDelete);
}
