import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/extension/menu_item_type_extension.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({
    super.key,
    required this.type,
    this.isSelected = false,
    this.onMenuItemSelected,
  });

  final MenuItemTypeKit type;
  final bool isSelected;
  final Function(MenuItemTypeKit)? onMenuItemSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
      isSelected && onMenuItemSelected == null
          ? null
          : onMenuItemSelected!(type),
      child: Container(
        color: Colors.transparent,
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
      ).cursorGesture,
    );
  }
}
