import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

extension WidgetExtension on Widget {
  Widget get cursorGesture {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        bool isHovered = false;
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          onHover: (_) => setState(() => isHovered = true),
          cursor: SystemMouseCursors.click,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: isHovered
                  ? context.primaryColor.withOpacity(0.5)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: this,
          ),
        );
      },
    );
  }
}
