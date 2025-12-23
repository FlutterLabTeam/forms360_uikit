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
      onTap: () => isSelected && onMenuItemSelected == null
          ? null
          : onMenuItemSelected!(type),
      child: Container(
        color: Colors.transparent,
        width: 48,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 22,
              height: 22,
              child: Icon(
                isSelected ? type.iconDataSelected : type.iconDataUnselected,
                color: isSelected ? context.primaryColor : Color(0xFFA3B2BC),
                size: 22,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              type.toMenuTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? context.primaryColor : Color(0xFFA3B2BC),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ).cursorGestureWithHover,
    );
  }
}
