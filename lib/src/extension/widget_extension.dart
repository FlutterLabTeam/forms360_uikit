import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

extension WidgetExtension on Widget {
  Widget get cursorGesture {
    return MouseRegion(
      child: this,
      cursor: SystemMouseCursors.click,
    );
  }

  Widget get cursorGestureWithHover {
    bool isHovered = false;

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
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
                  ? context.primaryColor.withOpacity(0.07)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: this,
          ),
        );
      },
    );
  }

  Widget get cursorHover {
    bool isHovered = false;

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          onHover: (_) => setState(() => isHovered = true),
          cursor: SystemMouseCursors.click,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: isHovered
                  ? context.primaryColor.withOpacity(0.07)
                  : Colors.transparent,
            ),
            child: this,
          ),
        );
      },
    );
  }
}
